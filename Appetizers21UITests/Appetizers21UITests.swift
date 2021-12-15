//
//  Appetizers21UITests.swift
//  Appetizers21UITests
//
//  Created by Simon Berner on 08.12.21.
//

import XCTest

class Appetizers21UITests: XCTestCase {

    let app = XCUIApplication()
    let explicitWait: TimeInterval = 2

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

    // Check that an appetizer can be selected and added to 'Orders'
    func testAppetizerCanBeAddedToOrders() throws {

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
        XCTAssertTrue(orderPlaced.waitForExistence(timeout: explicitWait))
    }

    // Check that the 'Invalid Form' Alert is shown when the account form is invalid and the user clicks 'Save Changes'
    func testInvalidAccountFormAlertIsShown() throws {

        // Given
        let tabBarAccount = app.tabBars["Tab Bar"].buttons["Account"]
        let saveChangesButton = app.buttons["SaveChanges"]
        let invalidFormAlert = app.alerts["Invalid Form"]
//        let okButton = app.buttons["OK"]

        // When
        tabBarAccount.tap()
        saveChangesButton.tap()

        // Then
        XCTAssertTrue(invalidFormAlert.waitForExistence(timeout: explicitWait))
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
