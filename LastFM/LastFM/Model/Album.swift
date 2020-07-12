//
//  Album.swift
//  LastFM
//
//  Created by Mohit Gupta on 11/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import Foundation


// MARK: - Results
struct Albums: Codable {
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let albummatches: Albummatches
    let attr: Attr

    enum CodingKeys: String, CodingKey {
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }
}

// MARK: - Albummatches
struct Albummatches: Codable {
    let album: [Album]
}

// MARK: - Album
struct Album: Codable {
    let name, artist: String
    let url: String
    let image: [Image]
    let streamable, mbid: String
}
// MARK : - Get Image path of album data
extension Album {
    func getImageURL(imageSize: Size) -> String? {
        if let image = self.image.filter({$0.size == imageSize}).first {
            return image.text
        }
        return nil
    }

}

// MARK: - Image
struct Image: Codable {
    let text: String
    let size: Size

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum Size: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

// MARK: - Attr
struct Attr: Codable {
    let attrFor: String

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}


