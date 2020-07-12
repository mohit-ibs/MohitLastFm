//
//  MockDataAndJson.swift
//  LastFMTests
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation
@testable import LastFM

class MockDataAndJson {
    class func jsonStirngWithAlbumData() -> String {
        return "{\"results\":{\"opensearch:Query\":{\"#text\":\"\",\"role\":\"request\",\"searchTerms\":\"believe\",\"startPage\":\"1\"},\"opensearch:totalResults\":\"125343\",\"opensearch:startIndex\":\"0\",\"opensearch:itemsPerPage\":\"50\",\"albummatches\":{\"album\":[{\"name\":\"Believe\",\"artist\":\"Disturbed\",\"url\":\"https://www.last.fm/music/Disturbed/Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"small\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/64s/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"medium\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/174s/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"large\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/300x300/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"extralarge\"}],\"streamable\":\"0\",\"mbid\":\"c559efc2-f734-41ae-93bd-2d78414e0356\"},{\"name\":\"Make Believe\",\"artist\":\"Weezer\",\"url\":\"https://www.last.fm/music/Weezer/Make+Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"small\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/64s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"medium\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/174s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"large\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/300x300/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"extralarge\"}],\"streamable\":\"0\",\"mbid\":\"9e7103bb-fc9a-4e5a-a90c-2a3ab4c08e19\"},{\"name\":\"Believe\",\"artist\":\"Justin Bieber\",\"url\":\"https://www.last.fm/music/Justin+Bieber/Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/899fe1643173a9568ac6e832327e7b57.png\",\"size\":\"small\"}],\"streamable\":\"0\",\"mbid\":\"a40e791d-14b2-480f-b5d4-053e27b57134\"}]},\"@attr\":{\"for\":\"believe\"}}}\r\n"
    }
    
    class func jsonStirngWithAlbumDataWithMissingSomeImageSize() -> String {
        return "{\"results\":{\"opensearch:Query\":{\"#text\":\"\",\"role\":\"request\",\"searchTerms\":\"believe\",\"startPage\":\"1\"},\"opensearch:totalResults\":\"125343\",\"opensearch:startIndex\":\"0\",\"opensearch:itemsPerPage\":\"50\",\"albummatches\":{\"album\":[{\"name\":\"Believe\",\"artist\":\"Disturbed\",\"url\":\"https://www.last.fm/music/Disturbed/Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"small\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/174s/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"large\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/300x300/bca3b80481394e25b03f4fc77c338897.png\",\"size\":\"extralarge\"}],\"streamable\":\"0\",\"mbid\":\"c559efc2-f734-41ae-93bd-2d78414e0356\"},{\"name\":\"Make Believe\",\"artist\":\"Weezer\",\"url\":\"https://www.last.fm/music/Weezer/Make+Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"small\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/64s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"medium\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/174s/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"large\"},{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/300x300/1c8439b16ed4ca4e0bac727e7b325581.png\",\"size\":\"extralarge\"}],\"streamable\":\"0\",\"mbid\":\"9e7103bb-fc9a-4e5a-a90c-2a3ab4c08e19\"},{\"name\":\"Believe\",\"artist\":\"Justin Bieber\",\"url\":\"https://www.last.fm/music/Justin+Bieber/Believe\",\"image\":[{\"#text\":\"https://lastfm.freetls.fastly.net/i/u/34s/899fe1643173a9568ac6e832327e7b57.png\",\"size\":\"small\"}],\"streamable\":\"0\",\"mbid\":\"a40e791d-14b2-480f-b5d4-053e27b57134\"}]},\"@attr\":{\"for\":\"believe\"}}}\r\n"
    }
    
    class func jsonStirngWithNoAlbumData() -> String {
        return "{\"results\":{\"opensearch:Query\":{\"#text\":\"\",\"role\":\"request\",\"searchTerms\":\"believe\",\"startPage\":\"1\"},\"opensearch:totalResults\":\"125343\",\"opensearch:startIndex\":\"0\",\"opensearch:itemsPerPage\":\"50\",\"albummatches\":{\"album\":[]},\"@attr\":{\"for\":\"believe\"}}}\r\n"
    }
    
    class func invalidJson() -> String {
        return "{\"data\":{}}\r\n"
    }
    
    class func getAlbumObject() -> Albums? {
        let jsonData = MockDataAndJson.jsonStirngWithAlbumData().data(using: .utf8)
        
        // Parse the JSON
        if let results = Utils.parseJSON(inputData: jsonData! as NSData),let result = results["results"] {
            do {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted) else {
                    return nil
                }
                
                let album = try JSONDecoder().decode(Albums.self, from: jsonData)
                return album
                
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    class func getAlbumObjectWithMissingImageInfo() -> Albums? {
        let jsonData = MockDataAndJson.jsonStirngWithAlbumDataWithMissingSomeImageSize().data(using: .utf8)
        
        // Parse the JSON
        if let results = Utils.parseJSON(inputData: jsonData! as NSData),let result = results["results"] {
            do {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted) else {
                    return nil
                }
                
                let album = try JSONDecoder().decode(Albums.self, from: jsonData)
                return album
                
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
    
    class func getAlbumObjectWithNoAlbumData() -> Albums? {
        let jsonData = MockDataAndJson.jsonStirngWithNoAlbumData().data(using: .utf8)
        
        // Parse the JSON
        if let results = Utils.parseJSON(inputData: jsonData! as NSData),let result = results["results"] {
            do {
                guard let jsonData = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted) else {
                    return nil
                }
                
                let album = try JSONDecoder().decode(Albums.self, from: jsonData)
                return album
                
            } catch {
                return nil
            }
        } else {
            return nil
        }
    }
}
