//
//  ImageRotationTests.swift
//  RotateImageUsingSlider
//
//  Created by webonise on 08/11/16.
//  Copyright © 2016 webonise. All rights reserved.
//

import XCTest
@testable import RotateImageUsingSlider

class ImageRotationTests: XCTestCase {

    var valueOfSlider: CGFloat!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        valueOfSlider = 0.0
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        valueOfSlider = 0.0
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
