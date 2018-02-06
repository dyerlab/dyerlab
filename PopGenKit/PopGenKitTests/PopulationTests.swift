//
//  PopulationTests.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class PopulationTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let pop = makeRandomPopulation()
        
        XCTAssertEqual(pop.count, 100 )
        XCTAssertEqual(pop.keys.count, 21)
        
        var keys = pop.keysForType(type: IndividualDataType.Strata)
        print("Strata: \(keys)")
        XCTAssertEqual( keys.count, 1 )
        XCTAssertEqual( keys, ["Population"])
        
        keys = pop.keysForType(type: IndividualDataType.Coordinates)
        print("Coordinates: \(keys)")
        XCTAssertEqual( keys.count, 0 )
        
        keys = pop.keysForType(type: IndividualDataType.External )
        print("External: \(keys)")
        XCTAssertEqual( keys.count, 0 )
        
        keys = pop.keysForType(type: IndividualDataType.Loci)
        print("Loci: \(keys)")
        XCTAssertEqual( keys.count, 20 )
        
        
        
        
    }
    
    
}
