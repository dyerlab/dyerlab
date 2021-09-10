//
//  TestFrequencies.swift
//  DLabTests
//
//  Created by Rodney Dyer on 8/13/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import XCTest

class TestFrequencies: XCTestCase {


    func testInit() throws {
        
        let ind1 = Individual()
        let ind2 = Individual()
        let ind3 = Individual()
        
        ind1.loci["TPI"] = Locus(left: "A", right: "B")
        ind1.loci["AAT"] = Locus(left: "c", right: "c")
        ind1.loci["CPI"] = Locus(left: "1", right: "1")
        
        ind2.loci["TPI"] = Locus(left: "A", right: "B")
        ind2.loci["AAT"] = Locus(left: "c", right: "C")
        ind2.loci["CPI"] = Locus(left: "1", right: "2")

        ind3.loci["TPI"] = Locus(left: "A", right: "A")
        ind3.loci["AAT"] = Locus(left: "c", right: "c")
        ind3.loci["CPI"] = Locus(left: "2", right: "2")

        let frequencies = Frequencies()
        
        frequencies.addIndividual( ind1 )
        frequencies.addIndividual( ind2 )
        frequencies.addIndividual( ind3 )
        
        for key in frequencies.frequencies.keys {
            if let f = frequencies.frequencies[key] {
                print("Locus: \(key)")
                print("\(f)")
            }
        }
        
        XCTAssertEqual( frequencies.frequencies.count, 3 )
        XCTAssertEqual( frequencies.frequencies["TPI"]?.frequency(name: "B"), 2.0/6.0 )
        XCTAssertEqual( frequencies.frequencies["TPI"]?.frequency(name: "A"), 4.0/6.0 )
        XCTAssertEqual( frequencies.frequencies["TPI"]?.frequency(name: "z"), 0.0 )
        
    }


}
