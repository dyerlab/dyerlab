//
//  testArray.swift
//  MatrixKitTestsTests
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import MatrixKit

class testArray: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRandomElement() {
        let vec = [1,2,3,4,5]
        if let val = vec.randomElement() {
            XCTAssertTrue( vec.contains(val))
        }
        else {
            XCTFail()
        }
    }
    
    
    
    func testSum() {
        let vecInt = [1,2,3,4]
        let vecDouble = [1.1,2.2,3.3,4.4]
        
        XCTAssertEqual( vecInt.sum(), 10 )
        XCTAssertEqual( vecDouble.sum(), 11.0) 
    }

}
