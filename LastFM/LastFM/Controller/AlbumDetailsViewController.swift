//
//  AlbumDetailsViewController.swift
//  LastFM
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    
    var albumModel :Album!
    @IBOutlet private weak var lblAlbumName: UILabel!
    @IBOutlet private weak var lblArtistName: UILabel!
    @IBOutlet private weak var albumImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.lblArtistName.text = albumModel.artist
        self.lblAlbumName.text = albumModel.name
        
        if let imageURL = albumModel.getImageURL(imageSize: .extralarge) {
            albumImage.loadImageUsingCacheWithURLString(imageURL, placeHolder: nil) { (bool) in
                //Do additional setup after loading the Image
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
