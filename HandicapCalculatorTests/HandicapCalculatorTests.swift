//
//  HandicapCalculatorTests.swift
//  HandicapCalculatorTests
//
//  Created by R Veen on 29/09/2019.
//  Copyright © 2019 R Veen. All rights reserved.
//

import XCTest
@testable import HandicapCalculator

class HandicapCalculatorTests: XCTestCase {
    
    let calculator = HandicapCalculator()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        calculator.calculate(currentHandicap: 0.0, stablefordPoints: 0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
