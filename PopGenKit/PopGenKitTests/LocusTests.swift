//
//  LocusTests.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class LocusTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        let x = Locus(["B","A"])
        XCTAssertTrue(x.ploidy == 2)
        XCTAssertTrue(x.isHeterozygote())
        XCTAssertFalse(x.isEmpty())
        XCTAssertEqual(x.alleles, ["A","B"])
    }
    
    func testConversions() {
        let loc = Locus(["C","A"])
        let alleles = ["A","B","C"]
        let vec1 = loc.asVector(alleles: alleles)
        let vec2 = loc.asVector(alleles: alleles, standardized: true )
        
        XCTAssertTrue(vec1.count == 3)
        XCTAssertTrue(vec2.count == 3)
        XCTAssertEqual( vec1, [1.0,0.0,1.0])
        XCTAssertEqual( vec2, [0.5,0.0,0.5])
    }
    
    func testEquality() {
        let loc1 = Locus(["A","B"])
        let loc2 = Locus(["B","A"])
        let loc3 = Locus(["A","A"])
        
        XCTAssertTrue(loc1 == loc2 )
        XCTAssertFalse(loc1 == loc3)
    }
}
