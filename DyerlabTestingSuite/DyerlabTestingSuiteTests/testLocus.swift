//
//  LocusTests.swift
//  PopGenKitTestsTests
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGenKit

class testLocus: XCTestCase {
    
    var locNull: Locus!
    var locA: Locus!
    var locAA: Locus!
    var locAAb: Locus!
    var locAB: Locus!
    var locAAAA: Locus!
    var locAABC: Locus!

    
    
    override func setUp() {
        super.setUp()
        
        locNull = Locus([])
        locA = Locus( ["A"] )
        locAA = Locus( ["A:A"] )
        locAAb = Locus( ["A","A"])
        locAB = Locus( ["A","B"] )
        locAAAA = Locus( ["A","A","A","A"])
        locAABC = Locus( ["A","A","B","C"])

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        
        // Equality operators
        XCTAssertEqual(locAA, locAAb )
        XCTAssertNotEqual(locAA, locAB)

        // Empty
        XCTAssertFalse(locA.isEmpty())
        XCTAssertTrue(locNull.isEmpty())
        
        // ploidy
        XCTAssertEqual(locNull.ploidy, 0 )
        XCTAssertEqual(locA.ploidy, 1 )
        XCTAssertEqual(locAA.ploidy, 2 )
        XCTAssertEqual(locAB.ploidy, 2 )
        XCTAssertEqual(locAAAA.ploidy, 4 )
        XCTAssertEqual(locAABC.ploidy, 4 )
        
        // Heterozygote
        XCTAssertFalse(locNull.isHeterozygote())
        XCTAssertFalse(locAA.isHeterozygote())
        XCTAssertFalse(locAAAA.isHeterozygote())
        XCTAssertTrue(locAB.isHeterozygote())
        XCTAssertTrue(locAABC.isHeterozygote())
    }
    
    
    func testVectorOps() {
        let alleles = ["A","B","C","D"]
        let vecNull = [0.0, 0.0, 0.0, 0.0]
        let vecA = [1.0, 0.0, 0.0, 0.0 ]
        let vecAB = [1.0, 1.0, 0.0, 0.0 ]
        let vecABs = [0.5, 0.5, 0.0, 0.0 ]
        let vecAABC = [0.5, 0.25, 0.25, 0.0]

        XCTAssertEqual( locNull.asVector( alleles: alleles ), vecNull )
        XCTAssertEqual( locA.asVector( alleles: alleles ), vecA )
        XCTAssertEqual( locA.asVector( alleles: alleles, standardized: true ), vecA )
        XCTAssertEqual( locAB.asVector( alleles: alleles ), vecAB )
        XCTAssertEqual( locAB.asVector( alleles: alleles, standardized: true ), vecABs )
        XCTAssertEqual( locAABC.asVector( alleles: alleles, standardized: true ), vecAABC )
        
    }

}
