//
//  MatrixTexts.swift
//  MatrixKitTests
//
//  Created by Rodney Dyer on 2/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class MatrixTexts: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        
        print("\nMATRIX TESTS\n")
        var X: Matrix = Matrix(rows: 2, cols: 2 )
        
        XCTAssertTrue( X.rows == 2 )
        XCTAssertTrue( X.cols == 2 )
        XCTAssertTrue( X.values == [0.0, 0.0, 0.0, 0.0] )
        print("this is X: \(X)")
        
        X[0,0] = 1.0
        X[0,1] = 2.0
        X[1,0] = 3.0
        X[1,1] = 4.0
        print("this is X: \(X)")
        
        let d = X.diagonal()
        XCTAssertEqual(d,[1.0,4.0])
        
        var r = X.row(0)
        print("This is r:\n\(r)")
        XCTAssertEqual(r, [1.0, 2.0] )
        r = X.row(1)
        print("This is r:\n\(r)")
        XCTAssertEqual(r, [3.0, 4.0] )
        
        var c = X.col(0)
        print("This is c:\n\(c)")
        XCTAssertEqual(c, [1.0, 3.0] )
        c = X.col(1)
        print("This is c:\n\(c)")
        XCTAssertEqual(c, [2.0, 4.0] )
        
    }
    
    
    func testOperators() {
        var X: Matrix = Matrix(rows: 2, cols: 2 )
        X[0,0] = 1.0
        X[0,1] = 2.0
        X[1,0] = 3.0
        X[1,1] = 4.0
        
        var Y = X + X
        XCTAssertEqual( Y[0,0], 2.0 )
        XCTAssertEqual( Y[0,1], 4.0 )
        XCTAssertEqual( Y[1,0], 6.0 )
        XCTAssertEqual( Y[1,1], 8.0 )
        
    }



}
