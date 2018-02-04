//
//  IndividualTests.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class IndividualTests: XCTestCase {

    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInit() {
        let theInd = Individual()
        theInd.strata["Population"] = "RVA"
        theInd.coords["Latitude"] = -77.46
        theInd.coords["Longitude"] = 36.35
        theInd.external["Elevation"] = 34.3
        theInd.loci["LAP"] = Locus(["1","3"])
        theInd.loci["EM"] = Locus(["A","C"])
        
        XCTAssertEqual( theInd.type(key: "Population"), IndividualDataType.Strata )
        XCTAssertEqual( theInd.type(key: "Latitude"), IndividualDataType.Coordinates )
        XCTAssertEqual( theInd.type(key: "Longitude"), IndividualDataType.Coordinates )
        XCTAssertEqual( theInd.type(key: "Elevation"), IndividualDataType.External )
        XCTAssertEqual( theInd.type(key: "LAP"), IndividualDataType.Loci )
        XCTAssertEqual( theInd.type(key: "EM"), IndividualDataType.Loci )
        XCTAssertEqual( theInd.type(key: "Bob"), IndividualDataType.Unknown )
        
        XCTAssertEqual( theInd.data("Population"), "RVA")
        XCTAssertEqual( theInd.data("Latitude"), "-77.46")
        XCTAssertEqual( theInd.data("LAP"), "1:3")
    }
    
    
    
}
