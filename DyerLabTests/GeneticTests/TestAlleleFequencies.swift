//
//  TestAlleleFequencies.swift
//  DLabTests
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import XCTest

class TestAlleleFequencies: XCTestCase {

    

    func testExample() throws {
        let freq = AlleleFrequencies.exampleFrequencies()
        
        print( freq.description )
        
        XCTAssertEqual( freq.alleles.count, 2 )
        XCTAssertEqual( freq.alleles, ["A","B"] )
        XCTAssertEqual( freq.frequency(name: "A"), 0.5 )
        XCTAssertEqual( freq.frequency(name: "B"), 0.5 )
        XCTAssertEqual( freq.frequency(name: "C"), 0.0 )
        XCTAssertEqual( freq.He, 0.5 )
        XCTAssertEqual( freq.Ho, 0.4 )
        XCTAssertEqual( freq.Fis, 1.0 - 0.4/0.5 )
        
        freq.addLocus(loc: Locus())
        XCTAssertEqual( freq.frequency(name: "A"), 0.5 )
        
    }


}
