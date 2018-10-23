//
//  testPopulation.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGenKit


class testPopulation: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testPopulation() {
        let thePop = Population()
        
        XCTAssertTrue( thePop.count == 0 )
        
        let ind1 = Individual()
        ind1.loci["Locus"] = Locus(["A:B"])
        ind1.strata["Population"] = "RVA"
        ind1.coords.longitude = -77.46
        ind1.coords.latitude = 37.53
        
        let ind2 = Individual()
        ind2.loci["Locus"] = Locus(["A:A"])
        ind2.strata["Population"] = "SEA"
        ind2.coords.longitude = -122.33
        ind2.coords.latitude = 47.61
        
        thePop.individuals.append(ind1)
        thePop.individuals.append(ind2)
        
        XCTAssertEqual( thePop.count, 2 )
        
        XCTAssertEqual( thePop.keys, ["Population","Latitude","Longitude","Locus"])
        
        XCTAssertEqual( thePop.keysForType( type: .Strata ), ["Population"] )
        XCTAssertEqual( thePop.keysForType( type: .Latitude ), ["Latitude"] )
        XCTAssertEqual( thePop.keysForType( type: .Longitude ), ["Longitude"] )
        XCTAssertEqual( thePop.keysForType( type: .External ), [] )
        XCTAssertEqual( thePop.keysForType( type: .Loci ), ["Locus"] )
        
        XCTAssertEqual( thePop.getValues(key: "Locus") as! [Locus], [ Locus( ["A:B"] ),Locus( ["A:A"]) ] )
        
        XCTAssertEqual( thePop.data(key: "Population", row: 1), "SEA")
        XCTAssertEqual( thePop.data(key: "Latitude", row: 0), "37.53" )
        
    }

}
