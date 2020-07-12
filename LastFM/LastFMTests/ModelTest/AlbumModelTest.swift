//
//  AlbumModelTest.swift
//  LastFMTests
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import XCTest
@testable import LastFM

class AlbumModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValidateModel() {
        if let album = MockDataAndJson.getAlbumObject() {
            XCTAssertNotNil(album)
            XCTAssert(album.albummatches.album.count > 0)
            let albumDetails = album.albummatches.album[0]
            XCTAssertNotNil(albumDetails.getImageURL(imageSize: .small))
        }
    }
    
    func testValidateMissingImageData() {
        if let album = MockDataAndJson.getAlbumObjectWithMissingImageInfo() {
            XCTAssertNotNil(album)
            XCTAssert(album.albummatches.album.count > 0)
            let albumDetails = album.albummatches.album[0]
            XCTAssertNil(albumDetails.getImageURL(imageSize: .medium))
        }
    }

}
