//
//  Constant.swift
//  LastFM
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

struct SegueIdentifier {
    static let showAlbumDetails = "AlbumDetailsViewController"
}

struct Cells {
    static let albumList = "AlbumTableViewCell"
}

struct ErrorString {
    static let urlIsNotCorrect = "URL is not correct"
    static let dataNotFound = "Data is not found"
}

struct APICallIdentifier {
    static let apiKey = "e39f6699ff217df57a4e1403727e29a2"
    static let baseURL = "http://ws.audioscrobbler.com/2.0/?format=json"
    static let methodAlbumSearch = "method=album.search"
}
