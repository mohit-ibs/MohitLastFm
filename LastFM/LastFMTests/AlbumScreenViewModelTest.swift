//
//  AlbumScreenViewModelTest.swift
//  LastFMTests
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import XCTest
@testable import LastFM

class AlbumScreenViewModelTest: XCTestCase {
    
    /// A fake API that will return data as needed without any actual networking
    class FakeAPI : AlbumAPI {
        
        private let album: Albums?
        /**
         * Create a FakeAPI
         *
         * - Parameter story: The story that should be returned immediately
         * when requested via `getAllAlbums`
         * - Parameter loadForever: Set this if you want the API to never send
         * back data
         */
        init(album: Albums? = nil) {
            self.album = album
        }
        func getAllAlbums(searchText: String, callback: @escaping AlbumsCallback, errorCallBack: @escaping errorCallback) {
            guard let albumData = album else {
                errorCallBack("No data found")
                return
            }
            
            callback(albumData)
        }
     }
    

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
    
    func testGetAllAlbums() {
        if let albums = MockDataAndJson.getAlbumObject() {
            let viewModel = AlbumScreenViewModel(api: FakeAPI(album: albums))
            viewModel.onTextSearch(searchText: "Test Data", successCallback: { (albums) in
                XCTAssertNotNil(albums)
            }) { (error) in
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testGetAllAlbumsWithAlbumData() {
        if let albums = MockDataAndJson.getAlbumObject() {
            let viewModel = AlbumScreenViewModel(api: FakeAPI(album: albums))
            viewModel.onTextSearch(searchText: "Test Data", successCallback: { (albums) in
                if albums.albummatches.album.count > 0 {
                    XCTAssertTrue(albums.albummatches.album.count > 0)
                }
            }) { (error) in
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testGetAllAlbumsWithNoAlbumData() {
        if let albums = MockDataAndJson.getAlbumObjectWithNoAlbumData() {
            let viewModel = AlbumScreenViewModel(api: FakeAPI(album: albums))
            viewModel.onTextSearch(searchText: "Test Data", successCallback: { (albums) in
                XCTAssertTrue(albums.albummatches.album.count == 0)
            }) { (error) in
                XCTAssertNotNil(error)
            }
        }
    }
    
    func testGetAllAlbumsWithError() {
        let viewModel = AlbumScreenViewModel(api: FakeAPI(album: nil))
        viewModel.onTextSearch(searchText: "Test Data", successCallback: { (albums) in
            XCTAssertNil(albums)
        }) { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testGetAlbumDatAtIndex() {
        let albumModel = MockDataAndJson.getAlbumObject()
        let viewModel = AlbumScreenViewModel(api: FakeAPI(album: albumModel))
        viewModel.albumList = albumModel?.albummatches.album
        XCTAssertNotNil(viewModel.getAlbumDatAtIndex(index: 0))
    }

    func testGetAlbumDatAtWrongIndex() {
        let albumModel = MockDataAndJson.getAlbumObject()
        let viewModel = AlbumScreenViewModel(api: FakeAPI(album: albumModel))
        viewModel.albumList = albumModel?.albummatches.album
        XCTAssertNil(viewModel.getAlbumDatAtIndex(index: 7))
    }
}
