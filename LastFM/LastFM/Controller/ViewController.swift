//
//  ViewController.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel = AlbumScreenViewModel()
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        activityIndicator.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.showAlbumDetails {
            performSegueForShowAlbumDetails(segue: segue)

        } 
    }
    
    private func performSegueForShowAlbumDetails(segue :UIStoryboardSegue) {
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("indexPath not found")
        }
        
        if let albumModel = viewModel.getAlbumDatAtIndex(index:indexPath.row) {
            let albumDetailsView = segue.destination as! AlbumDetailsViewController
            albumDetailsView.albumModel = albumModel
        }
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchedText = searchBar.text {
            self.activityIndicator.startAnimating()
            viewModel.onTextSearch(searchText:searchedText.addPercentEncodingInWhiteSpace(), successCallback: {[unowned self] (album) in
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
            }) {[unowned self] (errorMessage) in
                self.activityIndicator.stopAnimating()
                print(errorMessage)
            }
        }
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel.albumList = nil
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albumList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Check data is valid
        guard let album = viewModel.getAlbumDatAtIndex(index:indexPath.row) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.albumList) as! AlbumTableViewCell
        cell.displayAlbumInCell(viewModel: album)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

