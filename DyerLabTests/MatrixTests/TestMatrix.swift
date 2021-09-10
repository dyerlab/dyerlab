//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  TestMatrix.swift
//  
//
//  Created by Rodney Dyer on 6/10/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.


import XCTest

final class MatrixTests: XCTestCase {
    
    private var mat1: Matrix!
    private var mat2: Matrix!
    
    override func setUpWithError() throws {
        mat1 = Matrix(3,3,1.0)
        mat2 = Matrix(3,3,2.0)
    }
    
    override func tearDownWithError() throws {
        mat1 = nil
        mat2 = nil
    }
    
    func testInit() throws {
        XCTAssertEqual( mat1.rows, 3 )
        XCTAssertEqual( mat1.cols, 3 )
        XCTAssertEqual( mat1[1,1], 1.0 )
        
        let seq = 1.0...9.0
        let m = Matrix(3,3, seq )
        XCTAssertEqual(m.rows, 3)
        XCTAssertEqual(m.cols, 3)
        XCTAssertEqual( m[0,0], 1.0 )
        XCTAssertEqual( m[0,1], 2.0 )
        XCTAssertEqual( m[2,2], 9.0 )
        
        let m1 = Matrix( 2, 3, 1.0...12.00 )
        XCTAssertEqual( m1.rows, 2 )
        XCTAssertEqual( m1.cols, 3 )
        XCTAssertEqual( m1[0,1], 3.2 )
        
        let m2 = Matrix( 2, 3, 2.0...12.0)
        XCTAssertEqual( m2[0,1], 4.0 )
        
        let m3 = Matrix(0,22, [1,2,3])
        XCTAssertEqual( m3.rows, 0)
        XCTAssertEqual( m3.cols, 0)
        XCTAssertEqual( m3.values.count, 0 )
        
        let I = Matrix(4,4)
        XCTAssertEqual( I.diagonal, [0.0, 0.0, 0.0, 0.0] )
        I.diagonal = Vector.init(repeating: 1.0, count: 4)
        XCTAssertEqual( I.diagonal.sum, I.sum  )
        XCTAssertEqual( I.rowSum, I.colSum )
        
        
        
    }
    
    
    func testLogicalOperators() throws {
        XCTAssertTrue( mat1 != mat2 )
        XCTAssertFalse( mat1 == mat2 )
    }
    
    func testSubscripts() throws {
        let nan = mat1[12,4]
        XCTAssertTrue( nan.isNaN )
    }
    
    
    
    func testArithmateicOperations() throws {
        XCTAssertEqual( mat1 + 1.0, mat2 )
        XCTAssertEqual( mat2 - 1.0, mat1 )
        XCTAssertEqual( mat1 * 2.0, mat2 )
        XCTAssertEqual( mat2 / 2.0, mat1 )
        
        XCTAssertEqual( mat1 + mat2, Matrix(3,3,3.0) )
        XCTAssertEqual( mat2 - mat1, mat1 )
        XCTAssertEqual( mat1 * mat2, mat2 )
        XCTAssertEqual( mat2 / mat2, mat1 )
        
        XCTAssertEqual( mat1 .* mat2, Matrix(3,3,6.0) )
        
        let vec: Vector = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0 ]
        
        let Z = Matrix(3, 3, vec )
        print( Z )
        XCTAssertEqual( Z.diagonal, [1.0, 5.0, 9.0] )
        XCTAssertEqual( Z.trace, 15.0 )
        XCTAssertEqual( Z.transpose.transpose, Z )
    }
    
    
    
    func testSums() throws {
        let A = Matrix( 2, 3, [3.0, 2.0, 2.0, 2.0, 3.0, -2.0 ])
        var v = A.colSum
            
        XCTAssertEqual( v.count, 3 )
        XCTAssertEqual( v, [5.0,5.0,0.0] )
        
        v = A.rowSum
        
        XCTAssertEqual( v.count, 2 )
        XCTAssertEqual( v, [7.0,3.0] )
    }

    
    func testCentering() throws {
        let A = Matrix( 2, 3, [3.0, 2.0, 2.0, 2.0, 3.0, -2.0 ])
        print("Centering")
        print(A)
        A.center()
        print(A)
    }
    
    
    
}
     

