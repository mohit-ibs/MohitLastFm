//
//  AlbumListAPITest.swift
//  LastFMTests
//
//  Created by Mohit Gupta on 12/07/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import XCTest
@testable import LastFM

class AlbumListAPITest: XCTestCase {
    
    
    /// Fake HTTP interface for faking the network calls
    class FakeHTTPInterface: HttpInterface {
        private let data: Data?
        private let response: URLResponse?
        private let error: Error?
        /// Will use the callback based on these values
        init(data: Data?, response: URLResponse?, error: Error?) {
            self.data = data
            self.response = response
            self.error = error
        }
        func makeRequest(request: URLRequest, callback: @escaping (Data?, URLResponse?, Error?) -> Void) {
            callback(data, response, error)
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
        let json = MockDataAndJson.jsonStirngWithAlbumData().data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = AlbumListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllAlbums(searchText: "test", callback: { (album) in
            XCTAssertNotNil(album)
            XCTAssert(album.albummatches.album.count > 0)
            expectation.fulfill()
        }) { (error) in
            print(error)
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGetNoAlbumsData() {
        let json = MockDataAndJson.jsonStirngWithNoAlbumData().data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = AlbumListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllAlbums(searchText: "test", callback: { (album) in
            XCTAssertNotNil(album)
            XCTAssert(album.albummatches.album.count == 0)
            expectation.fulfill()
        }) { (error) in
            print(error)
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testGetBadAlbumsData() {
        let json = MockDataAndJson.invalidJson().data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = AlbumListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllAlbums(searchText: "test", callback: { (album) in
        }) { (error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    
    func testGetBadString() {
        let json = "{\"data\":{}}\r\n".data(using: .utf8)
        
        let httpInterface = FakeHTTPInterface(data: json, response: nil, error: nil)
        let api = AlbumListAPI(httpInterface: httpInterface)
        let expectation = XCTestExpectation(description: "Make network request")
        // When
        api.getAllAlbums(searchText: "test data", callback: { (album) in
        }) { (error) in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

}
