//
//  AlbumAPI.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

protocol AlbumAPI {
    /// A callback for retrieving a list of Albums List
    typealias AlbumsCallback = ((Albums) -> Void)
    /// A error callback
    typealias errorCallback = ((String) -> Void)
    /// a callback for receiving a Album
    typealias AlbumCallback = ((Album?) -> Void)
    /// Get Album data based on search string
    func getAllAlbums(searchText:String, callback: @escaping AlbumsCallback, errorCallBack: @escaping errorCallback)
}
