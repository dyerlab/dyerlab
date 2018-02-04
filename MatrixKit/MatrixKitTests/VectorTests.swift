//
//  VectroTests.swift
//  MatrixKitTests
//
//  Created by Rodney Dyer on 2/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class VectorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        var vec = Vector(repeating:0.0, count: 5)
        
        XCTAssertTrue( vec.reduce(0,+) == 0 )
        XCTAssertTrue( vec.count == 5 )
        
        vec[1] = 10
        XCTAssertTrue( vec.reduce(0,+) == 10 )
        XCTAssertTrue( vec[1] == 10 )
        
    }
    
    func testOperators() {
        let vec1 = Vector(repeating:1.0, count: 3)
        let vec2 = Vector(repeating:2.0, count: 3)
        let vec_plus = vec1 + vec2
        let vec_minus = vec1 - vec2
        let vec_multiply = vec1 * vec2
        let vec_divide = vec1 / vec2
        
        XCTAssertEqual( vec_plus, [3.0, 3.0, 3.0] )
        XCTAssertEqual( vec_minus, [-1.0, -1.0, -1.0] )
        XCTAssertEqual( vec_multiply, [2.0, 2.0, 2.0] )
        XCTAssertEqual( vec_divide, [0.5, 0.5, 0.5 ] )
        
    }


}
