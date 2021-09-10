//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  TestVector.swift
//
//
//  Created by Rodney Dyer on 6/10/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.


import XCTest


final class VectorTests: XCTestCase {
    
    private var vec1: Vector!
    private var vec2: Vector!
    
    override func setUpWithError() throws {
        vec1 = Vector(repeating: 1.0, count: 4)
        vec2 = Vector(repeating: 2.0, count: 4)
    }
    
    override func tearDownWithError() throws {
        vec1 = nil
        vec2 = nil
    }
    
    func testInit() throws {
        XCTAssertEqual( vec1.count, 4 )
        XCTAssertEqual( vec2.count, 4 )
        
        XCTAssertTrue( vec1 != vec2 )
        
        
        let vec = zeros(10)
        XCTAssertEqual( vec.count, 10  )
        XCTAssertEqual( sum(vec), 0.0 )
        XCTAssertTrue( vec != vec1 )
        
        let vec2 = randomVector(2, type: RangeEnum.normal_0_1)
        XCTAssertEqual( vec2.count, 2 )
    }
    
    func testLogicalOperators() throws {
        XCTAssertTrue( vec1 != vec2 )
        XCTAssertFalse( vec1 == vec2 )
    }
    
    func testArithmaticOperators() throws {
        
        // Vector/Scalar
        XCTAssertEqual( vec1 + 1.0, vec2 )
        XCTAssertEqual( vec2 - 1.0, vec1 )
        XCTAssertEqual( vec1 * 2.0, vec2 )
        XCTAssertEqual( vec2 / 2.0, vec1 )
        
        
        // Vector/Vector
        XCTAssertEqual( vec1 + vec1, vec2 )
        XCTAssertEqual( vec2 - vec1, vec1 )
        XCTAssertEqual( vec1 * vec2, vec2 )
        XCTAssertEqual( vec2 / vec1, vec2 )
        
        // Dot products
        XCTAssertEqual( vec1 .* vec2, 8.0 )
        XCTAssertEqual( sum(vec1), 4.0 )
    }
    
    
    func testVectorDistance() throws {
        let v = [1.0, 0.0, 5.0]
        let w = [0.0, 2.0, 4.0]
        let d = distance(v, w)
        XCTAssertEqual( d, sqrt(6) )
        
        
        let diff = v - w
        let diff_len = diff.magnitude
        XCTAssertEqual( diff_len, d )
        
    }
    
    func testConversion() throws {
        
        let v: Vector = [24.0, 42.0]
        let cg = v.asCGPoint
        let sv = v.asSNCVector3
        
        let v0 = Vector()
        let cg0 = v0.asCGPoint
        let sv0 = v0.asSNCVector3
        
        let v1: Vector = [32.0]
        let cg1 = v1.asCGPoint
        let sv1 = v1.asSNCVector3
        
        let v3: Vector = [1.0, 2.0, 3.0]
        let sv3 = v3.asSNCVector3
        let cg3 = v3.asCGPoint
                
        XCTAssertEqual( cg0.x, 0.0 )
        XCTAssertEqual( cg0.y, 0.0 )
        XCTAssertEqual( sv0.x, 0.0 )
        XCTAssertEqual( sv0.y, 0.0 )
        XCTAssertEqual( sv0.z, 0.0 )
        
        XCTAssertEqual( cg1.x, 32.0 )
        XCTAssertEqual( cg1.y, 0.0 )
        XCTAssertEqual( sv1.x, 32.0 )
        XCTAssertEqual( sv1.y, 0.0 )
        XCTAssertEqual( sv1.z, 0.0 )

        XCTAssertEqual( cg.x, 24.0 )
        XCTAssertEqual( cg.y, 42.0 )
        XCTAssertEqual( sv.x, 24.0 )
        XCTAssertEqual( sv.y, 42.0 )
        XCTAssertEqual( sv.z, 0.0  )
        
        XCTAssertEqual( cg3.x, 1.0 )
        XCTAssertEqual( cg3.y, 2.0 )
        XCTAssertEqual( sv3.x, 1.0 )
        XCTAssertEqual( sv3.y, 2.0 )
        XCTAssertEqual( sv3.z, 3.0 )
        
        let m = sqrt(  pow(24.0,2) + pow(42.0, 2))
        XCTAssertEqual( v.magnitude, m  )
        XCTAssertEqual( v.normal, [ 24.0/m, 42.0/m]  )

    }
    

    func testLimitations() throws {
        
        var v: Vector = [24.0, 42.0]
        let vlimit = v.constrain(minimum: 0.0, maximum: 27.0 )
        let vlimit2 = v.constrain(minimum: 27.0, maximum: 28.0 )
        
        XCTAssertEqual( vlimit[0], 24.0 )
        XCTAssertEqual( vlimit[1], 27.0 )
        
        XCTAssertEqual( vlimit2[0], 27.0 )
        XCTAssertEqual( vlimit2[1], 28.0 )
    
        var anneal1 = v.limitAnnealingMagnitude(temp: 25.7)
        XCTAssertEqual( anneal1[0], 24.0 )
        XCTAssertEqual( anneal1[1], 25.7 )
        
        v[1] = v[1] * -1
        anneal1 = v.limitAnnealingMagnitude(temp: 25.7)
        XCTAssertEqual( anneal1[0], 24.0 )
        XCTAssertEqual( anneal1[1], -25.7 )

        
    }
    
    
    
    
    
    
}

