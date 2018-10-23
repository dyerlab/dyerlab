//
//  testMatrix.swift
//  MatrixKitTestsTests
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import MatrixKit

class testMatrix: XCTestCase {
    

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let X = Matrix(rows: 4, cols: 4)
        let Y = Matrix(rows: 4, cols: 4, val: 0.0)
        let Z = Matrix( rows: 4, cols:4, val: 1.0)
        
        // Init and equality
        XCTAssertEqual( X, Y)
        XCTAssertEqual( Z+Y, Z )
        XCTAssertEqual( Z-Z, X)
        XCTAssertEqual( X+2.0, Z+Z )
        
        XCTAssertEqual( Z•Y, X)
        
        let I = IdentityMatrix(4)
        XCTAssertEqual(I[0,0], 1.0)
        XCTAssertEqual(I[0,1], 0.0)
        XCTAssertEqual(I.row(0),[1.0,0.0,0.0,0.0])
        var J = Matrix(rows: 4, cols: 4, values: sequence(from: 1, to: 16))
        XCTAssertEqual( J*I, J )
        
        let r2 = J.row(2)
        XCTAssertEqual( r2, [9.0, 10.0, 11.0, 12.0] )
        let c2 = J.col(2)
        XCTAssertEqual( c2, [3.0, 7.0, 11.0, 15.0] )
        
        print("J without colnames \n \(J)")
        J.rowNames = ["1","2","3","4"]
        J.colNames = ["A","B","C","D"]
        print("J with colnames \n \(J)")
    }


}
