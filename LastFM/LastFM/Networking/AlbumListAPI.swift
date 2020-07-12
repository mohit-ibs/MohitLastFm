//
//  AlbumListAPI.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation


class AlbumListAPI : AlbumAPI {
    private let httpInterface: HttpInterface

    /// Create a AlbumListAPI.
    ///
    /// - Parameter httpInterface: The interface used to make network requests.
    init(httpInterface: HttpInterface = HttpURLSessionWrapper()) {
        self.httpInterface = httpInterface
    }

    /// API call on the basis of search input.
    ///
    /// - Parameter searchText: find album
    /// - Parameter AlbumsCallback: callback event to notify view controller
    /// - Parameter errorCallBack:  callback event to notify view controller some error is occured
    func getAllAlbums(searchText:String, callback: @escaping AlbumsCallback, errorCallBack: @escaping errorCallback) {
        
        // Setup the request with URL
        var urlString = APICallIdentifier.baseURL + "&api_key=" + APICallIdentifier.apiKey
        urlString = urlString + "&" + APICallIdentifier.methodAlbumSearch
        urlString = urlString +  "&album=" + searchText
        
        guard let url = URL(string: urlString) else {
            DispatchQueue.main.async { errorCallBack(ErrorString.urlIsNotCorrect)}
            return
        }
        
        let request = URLRequest(url: url)
        httpInterface.makeRequest(request: request) { (data, response, error) in
            // Ensure the request succeeded
            guard let jsonData = data else {
                DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
                return
            }
            // Parse the JSON
            if let results = Utils.parseJSON(inputData: jsonData as NSData),let result = results["results"] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                    
                    if let album = try? JSONDecoder().decode(Albums.self, from: jsonData) {
                        DispatchQueue.main.async { callback(album) }
                    } else {
                        DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
                    }
                    
                } catch {
                    DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
                }
            } else {
                DispatchQueue.main.async { errorCallBack(ErrorString.dataNotFound)}
            }
        }
    }
}
