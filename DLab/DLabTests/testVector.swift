//
//  testVector.swift
//  MatrixKitTestsTests
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import MatrixKit

class testVector: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testVectorOperators() {
        let x = Vector(repeating: 1.0, count: 5)
        let y = Vector( repeating: 2.0, count: 5)
        
        // Initialization
        XCTAssertEqual(x.sum(),5.0)
        XCTAssertTrue(y.sum() == 10.0 )
        
        // Operator -
        XCTAssertEqual( y-x, x )
        // Operator +
        XCTAssertEqual( x+x, y )
        // Operator /
        XCTAssertEqual( y/x, y )
        XCTAssertEqual( y/1.0, y )
        // Operator *
        XCTAssertEqual( x*y, y )
        // Operator
        XCTAssertEqual( x*2.0, y )
        
        // Normalize
        XCTAssertEqual( y.normalize(), Vector(repeating: 1.0/5.0, count: 5) )
        
        // DistanceTo
        XCTAssertEqual( x.distanceTo(y), sqrt(5.0) )
        
        
        // Slice
        let z = [1.0,2.0,3.0,4.0]
        XCTAssertEqual( z.slice(from: 1,to: 2), [2.0,3.0] )
        
    }
}
