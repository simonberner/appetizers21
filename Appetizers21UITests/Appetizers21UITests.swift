//
//  Appetizers21UITests.swift
//  Appetizers21UITests
//
//  Created by Simon Berner on 08.12.21.
//

import XCTest

class Appetizers21UITests: XCTestCase {

    let app = XCUIApplication()

    // In UI tests it’s important to set the initial state (such as interface orientation)
    // required for your tests before they run. The setUp method is a good place to do this.
    // Put setup code here. This method is called before the invocation of each test method in the class.
    override func setUpWithError() throws {
        // Launching the app
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    // Put teardown code here. This method is called after the invocation of each test method in the class.
    override func tearDownWithError() throws {
        // Closing the app
        app.terminate()
    }

    func testOrderFlowWithOneAppetizer() throws {

        // Given
        let asianFlankSteak899Cell = app.tables.cells["Asian Flank Steak, $8.99"]
        let addButton = app.buttons["AddToOrder"]
        let tabBarOrder = app.tabBars["Tab Bar"].buttons["Order"]
        let orderPlaced  = asianFlankSteak899Cell.children(matching: .other).element(boundBy: 2).children(matching: .other).firstMatch

        // When
        asianFlankSteak899Cell.tap()
        addButton.tap()
        tabBarOrder.tap()

        // Then
        XCTAssertTrue(orderPlaced.waitForExistence(timeout: 2))
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
