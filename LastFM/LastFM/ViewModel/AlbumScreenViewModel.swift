//
//  AlbumScreenViewModel.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation

/// A view model for `AlbumScreenViewModel`. This contains the interaction
/// logic for the controller and sends `Albums to the
/// view-controller for presentation.

class AlbumScreenViewModel {
    /// Set this property to receive state change events
    typealias successCallback = ((Albums) -> Void)
    typealias errorCallback = ((String) -> Void)
    private let api: AlbumAPI
    var albumList : [Album]? = nil
    
    /// Create a AlbumScreenViewModel.
    ///
    /// - Parameter api: Used to interact with the network
    init(api: AlbumAPI = AlbumListAPI()) {
        self.api = api
    }
    
    /// Called when the view is on screen
    /// - Parameter searchText: Used to search string for album list
    /// - Parameter successCallback: Used to notify api call is succesfull
    /// - Parameter errorCallBack: Used to notify som error is occured
    func onTextSearch(searchText:String, successCallback: @escaping successCallback, errorCallBack: @escaping errorCallback) {
        api.getAllAlbums(searchText: searchText, callback: { (albums) in
            if albums.albummatches.album.count > 0{
                self.albumList = albums.albummatches.album
                successCallback(albums)
            } else{
                errorCallBack(ErrorString.dataNotFound)
            }}) { (error) in
                errorCallBack(error)
        }
    }
    
    //Find the specific album on particular index.
    /// - Parameter index: used to find specific album detail
    func getAlbumDatAtIndex(index:Int) -> Album? {
        if let albumData = albumList, albumData.count >= index, let album = albumList?[index] {
            return album
        }
        return nil
    }
}
