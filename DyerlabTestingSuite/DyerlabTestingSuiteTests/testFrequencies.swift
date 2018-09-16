//
//  testFrequencies.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGenKit

class testFrequencies: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testFrequencies() {
        var loci = Array<Locus>()
        
        loci.append( Locus( ["A","A"] ) )
        loci.append( Locus( ["A","A"] ) )
        loci.append( Locus( ["A","A"] ) )
        loci.append( Locus( ["A","B"] ) )
        loci.append( Locus( ["A","B"] ) )
        loci.append( Locus( ["A","B"] ) )
        loci.append( Locus( ["B","B"] ) )
        loci.append( Locus( ["B","B"] ) )
        loci.append( Locus( ["A","C"] ) )
        loci.append( Locus( ["A","B"] ) )
        
        XCTAssertEqual( loci.count, 10)
        
        let freqs = Frequencies(loci: loci, locusName: "Locus X")
        
        XCTAssertEqual( freqs.name, "Locus X")
        
        XCTAssertEqual( freqs.getHo(), 0.5)
        
        XCTAssertEqual( freqs.getFrequency(allele: "A"), 11.0/20.0 )
        XCTAssertEqual( freqs.getFrequency(allele: "B"),  8.0/20.0 )
        XCTAssertEqual( freqs.getFrequency(allele: "C"),  1.0/20.0 )
        XCTAssertEqual( freqs.getFrequency(allele: "D"),  0.0/20.0 )
        
        XCTAssertEqual( freqs.getHe(), 0.535, accuracy: 0.001 )
        
    }

}
