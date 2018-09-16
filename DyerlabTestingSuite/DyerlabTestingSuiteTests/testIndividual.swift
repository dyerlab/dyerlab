//
//  testIndividual.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGenKit

class testIndividual: XCTestCase {

    var ind: Individual!
    
    override func setUp() {
        super.setUp()

        ind = Individual()
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }


    func testInit() {
        
        XCTAssertTrue( ind.isEmpty() )
        
        XCTAssertEqual( ind.keysForType(type: .Strata), [])
        XCTAssertEqual( ind.keysForType(type: .Longitude), [])
        XCTAssertEqual( ind.keysForType(type: .Latitude), [])
        XCTAssertEqual( ind.keysForType(type: .External), [])
        XCTAssertEqual( ind.keysForType(type: .Loci), [])
        
        XCTAssertEqual( ind.type(key: "Bob"), .Unknown )
        
        XCTAssertEqual( ind.data(key: "Bob"), "" )
        
    }
    
    func testAddData() {
        ind.loci["locAA"] = Locus(["A","A"])
        ind.loci["locBb"] = Locus(["B","b"])
        ind.coords.latitude = 37.533
        ind.coords.longitude = -77.466
        ind.strata["State"] = "Virginia"
        ind.strata["City"] = "Richmond"
        ind.external["Elevation"] = 45.7
        
        XCTAssertEqual(ind.keysForType(type: .Loci).sorted(), ["locAA","locBb"].sorted())
        XCTAssertEqual(ind.keysForType(type: .Longitude), ["Longitude"])
        XCTAssertEqual(ind.keysForType(type: .Latitude), ["Latitude"])
        XCTAssertEqual(ind.keysForType(type: .Strata).sorted(), ["City","State"].sorted())
        XCTAssertEqual(ind.keysForType(type: .External), ["Elevation"])
        
        XCTAssertEqual( ind.type(key: "locAA"), .Loci )
        XCTAssertEqual( ind.type(key: "State"), .Strata )
        XCTAssertEqual( ind.type(key: "Elevation"), .External )
        XCTAssertEqual( ind.type(key: "Latitude"), .Latitude )
        XCTAssertEqual( ind.type(key: "Bob"), .Unknown )
        
        XCTAssertEqual( ind.data(key: "locAA"), "A:A")
        XCTAssertEqual( ind.data(key: "City"), "Richmond")
        XCTAssertEqual( ind.data(key: "Elevation"), "45.7")
        XCTAssertEqual( ind.data(key: "Longitude"), "-77.466")
        
        
        // Do the equality test in the same function
        
        let ind2: Individual = Individual()
        
        XCTAssertFalse( ind! == ind2 )
        
        ind2.loci[ "locAA" ] = Locus( ["A","A"] )
        ind2.loci[ "locBb" ] = Locus( ["B","b"] )
        ind2.coords.latitude = 37.533
        ind2.coords.longitude = -77.466
        ind2.strata[ "State" ] = "Virginia"
        ind2.strata[ "City" ] = "Richmond"
        ind2.external[ "Elevation" ] = 45.7
        
        XCTAssertFalse( ind! != ind2 )
        
        ind2.loci[ "locCc" ] = Locus( ["C","c"] )
        XCTAssertFalse( ind == ind2 )
        
    }

}
