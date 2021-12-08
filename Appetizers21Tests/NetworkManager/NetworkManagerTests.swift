//
//  NetworkManagerTests.swift
//  NetworkManagerTests
//
//  Created by Simon Berner on 08.12.21.
//

import XCTest
// Give the Unit-Tests access to the internal types and functions of Appetizers21
@testable import Appetizers21

class NetworkManagerTests: XCTestCase {

    private var networkManager: NetworkManager!

    // Put setup code here. This method is called before the invocation of each test method in the class.
    override func setUpWithError() throws {
        try super.setUpWithError()
        // make sure that every test starts with a clean state
        networkManager = NetworkManager.shared

    }

    // Put teardown code here. This method is called after the invocation of each test method in the class.
    override func tearDownWithError() throws {
        // make sure to clean the state of each tests
        networkManager = nil
        try super.tearDownWithError()
    }

    // Use XCTAssert and related functions to verify your tests produce the correct results.
    func test_successfull_appetizers_fetching() throws {
        // Arrange & Act
        networkManager.getAppetizers { [self] result in
            switch result {
            case .success(let appetizers):
                // Assert
                XCTAssertNotNil(appetizers)
            default:
                XCTFail("Fetching of Appetizers from \(networkManager.appetizerURL) failed!")
            }

        }

    }

    func test_successfull_image_fetching() throws {
        // Arrange
        let imageUrl = "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg"
        // Act
        networkManager.downloadImage(fromURLString: imageUrl) { uiImage in
            // Assert
            XCTAssertNotNil(uiImage)
        }
    }

    /*
     A performance test takes a block of code that you want to evaluate and runs it ten times,
     collecting the average execution time and the standard deviation for the runs. The averaging
     of these individual measurements form a value for the test run that can then be compared against
     a baseline to evaluate success or failure.
     */
//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
