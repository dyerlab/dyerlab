//
//  testPopGenKitFileIO.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGenKit

class testPopGenKitFileIO: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLoadFromFile() {
        
        let thePop = loadArapat()
        
        print(thePop.summary)
        
        
        print("Coord: \(thePop.individuals[0].coords)" )
        XCTAssertTrue( thePop.individuals[0].hasCoord() )
        
        XCTAssertEqual( thePop.keysForType(type: .Strata).count, 4)
        XCTAssertEqual( thePop.keysForType(type: .Latitude).count, 1)
        XCTAssertEqual( thePop.keysForType(type: .Longitude).count, 1)
        XCTAssertEqual( thePop.keysForType(type: .External).count, 0)
        XCTAssertEqual( thePop.keysForType(type: .Loci).count, 8)
        
        XCTAssertEqual( thePop.count, 363 )
        
    }
    
    
    func testMakeRandomPopulation() {
        let thePop = makeRandomPopulation()
        XCTAssertEqual( thePop.count, 100 )
        XCTAssertEqual( thePop.keysForType(type: .Strata).count, 1)
        XCTAssertEqual( thePop.keysForType(type: .Loci).count, 20 )
    }

}
