//
//  SwiftUIDemoUITests.swift
//  SwiftUIDemoUITests
//
//  Created by Ludovic Ollagnier on 09/03/2023.
//

import XCTest

final class SwiftUIDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testSomething() {

        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Vinyl list"]/*@START_MENU_TOKEN@*/.buttons["Ajouter"]/*[[".otherElements[\"Ajouter\"].buttons[\"Ajouter\"]",".buttons[\"Ajouter\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let collectionViewsQuery = app.collectionViews
        let tf = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Vinyl's title"]/*[[".cells.textFields[\"Vinyl's title\"]",".textFields[\"Vinyl's title\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tf.tap()

        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Create vinyl"]/*[[".cells.buttons[\"Create vinyl\"]",".buttons[\"Create vinyl\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery/*@START_MENU_TOKEN@*/.buttons["Plop"]/*[[".cells.buttons[\"Plop\"]",".buttons[\"Plop\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        XCTAssertTrue(app.textFields["Plop"].exists)

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
