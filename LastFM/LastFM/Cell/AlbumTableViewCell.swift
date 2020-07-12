//
//  AlbumTableViewCell.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblAlbumName: UILabel!
    @IBOutlet private weak var lblArtistName: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func displayAlbumInCell(viewModel: Album) {
        self.lblAlbumName.text = viewModel.name
        self.lblArtistName.text = viewModel.artist
        if let imageURL = viewModel.getImageURL(imageSize: .medium) {
            albumImage.loadImageUsingCacheWithURLString(imageURL, placeHolder: nil) { (bool) in
                //Do any Additional Stuff if needed
            }
        }
    }
    
}
