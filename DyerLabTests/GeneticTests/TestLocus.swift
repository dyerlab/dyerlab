//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  DLabTests
//  TestLocus.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest

class TestLocus: XCTestCase {
    

    func testInit() throws {
        let loc0 = Locus.exampleLocus(ploidy: .Missing,
                                      mask: .None,
                                      heterozygote: false)
        
        XCTAssertEqual( loc0.mask, .None )
        XCTAssertEqual( loc0.ploidy, .Missing )
        XCTAssertEqual( loc0.alleles, [String]() )
        XCTAssertFalse( loc0.isHeterozygote )
        XCTAssertTrue( loc0.isMissing )
        
        let loc1 = Locus(left: "A", right: "")
        let loc1m = Locus.exampleLocus(ploidy: .Haploid,
                                       mask: .None,
                                       heterozygote: false)
        XCTAssertEqual( loc1.ploidy, .Haploid )
        XCTAssertEqual( loc1.alleles, ["A"])
        XCTAssertFalse( loc1.isHeterozygote )
        XCTAssertFalse( loc1.isMissing )
        XCTAssertEqual( loc1, loc1m )
        
        let locAA = Locus.exampleLocus( ploidy: .Diploid,
                                        mask: .None,
                                        heterozygote: false )
        let locAB = Locus( left: "B", right: "A" )
        let locBC = Locus( left: "B", right: "C" )
        let locABm = Locus.exampleLocus(ploidy: .Diploid,
                                        mask: .Left,
                                        heterozygote: true)
        
        XCTAssertFalse( locAB == locABm )
        XCTAssertTrue( locBC.isHeterozygote )
        
        XCTAssertTrue( locAA != locAB )
        XCTAssertFalse( locAA.isMissing )
        XCTAssertEqual( locAA.ploidy, .Diploid )
        XCTAssertEqual( locAA.description, "A:A" )
        XCTAssertFalse( locAA.isHeterozygote )
        XCTAssertEqual( locAB.alleles, ["A","B"])
        XCTAssertFalse( locAA.maskInEffect )
        XCTAssertTrue( locAB.isHeterozygote )
        
        locAB.maskInEffect = true
        XCTAssertEqual( locAB.alleles, ["A","B"])
        locAB.mask = .Left
        XCTAssertEqual( locAB.alleles, ["B"] )
        locAB.mask = .Right
        XCTAssertEqual( locAB.alleles, ["A"] )
        
    }

    
    
    func testParents() throws {
        
        let mom1 = Locus(left: "A", right: "A")
        let mom2 = Locus(left: "A", right: "B")
        let mom3 = Locus(left: "B", right: "C")
        
        let off1 = Locus(left:"A",right:"B")
        let off2 = Locus(left:"B",right:"C" )
        let off3 = Locus(left: "C", right: "D")
        let off4 = Locus(left: "A", right: "B" )
        let off5 = Locus(left: "A", right: "A")
        
        
        off1.pullParent( parent: mom1 )
        XCTAssertEqual( off1.mask, .Left )
        XCTAssertEqual( off1.alleles, ["A","B"] )
        off1.maskInEffect.toggle()
        XCTAssertEqual( off1.alleles, ["B"] )
        
        off2.pullParent( parent: mom1 )
        XCTAssertEqual( off2.alleles, ["B","C"] )
        off1.maskInEffect.toggle()
        XCTAssertEqual( off2.mask, .Error )
        XCTAssertEqual( off2.alleles, ["B","C"] )
        
        off1.mask = .None
        off2.mask = .None
        
        off1.pullParent(parent: mom2 )
        XCTAssertEqual( off1.mask, .Error )
        
        off3.pullParent(parent: mom2)
        XCTAssertEqual( off3.mask, .Error )
        
        off4.pullParent(parent: mom2)
        XCTAssertEqual( off4.mask, .Error )
        
        off5.pullParent(parent: mom1 )
        XCTAssertEqual( off5.mask, .Right )
        
        off1.mask = .None
        off1.pullParent(parent: mom3 )
        XCTAssertEqual( off1.mask, .Right )
        off1.maskInEffect = true
        XCTAssertEqual( off1.alleles, ["A"])
        
        
        XCTAssertEqual( mom1.description, "A:A")
        XCTAssertEqual( mom2.description, "A:B")
        XCTAssertEqual( mom3.description, "B:C")
        
        
    }
    
    
    func testCoding() throws {
        
        let off1 = Locus(left:"A",right:"B")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try encoder.encode( off1 )
        print(String(data: data, encoding: .utf8)!)
        
        
        let decoder = JSONDecoder()
        
        let off2 = try decoder.decode(Locus.self, from: data)
        
        XCTAssertEqual( off1, off2 )
        
        
    }
    
}
