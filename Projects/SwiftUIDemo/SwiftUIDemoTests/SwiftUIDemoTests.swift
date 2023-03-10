//
//  SwiftUIDemoTests.swift
//  SwiftUIDemoTests
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import XCTest
@testable import SwiftUIDemo

final class SwiftUIDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddVinyl() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.

        let lib = Library()
        XCTAssertTrue(lib.vinyls.isEmpty)

        let vinyl = Vinyl(albumName: "Test", artist: "", releaseDate: Date(), numberInSerie: nil, titles: [], scratched: true, speed: .rpm33)
        lib.add(vinyl)
        XCTAssertFalse(lib.vinyls.isEmpty)
        XCTAssertEqual(lib.vinyls.first, vinyl)
    }


    func testAsyncFunc() {
//        let e = expectation(description: "")
//
//        e.fulfill()
//
//        waitForExpectations(timeout: 10)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
