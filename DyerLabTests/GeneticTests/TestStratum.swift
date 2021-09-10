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
//  TestStratum
//  TestStratum.swift
//
//  Created by Rodney Dyer on 8/17/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest

class TestStratum: XCTestCase {

/*
    func testInit() throws {
        
        let data = Stratum(name: "All")
        
        XCTAssertEqual( data.label, "All" )
        XCTAssertEqual( data.numIndividuals, 0 )
        XCTAssertEqual( data.numSubstrata, 0 )
        
        let names = ["Baja","Ctv","123"]
        data.addSubstrata(labels: names, levels: ["Region","Site", "Plot"] )
        XCTAssertEqual( data.numSubstrata, 1 )
        XCTAssertEqual( data.strataNames, ["Baja"] )
        
        XCTAssertEqual( data["Baja"]?.label, "Baja")
        XCTAssertEqual( data["Baja"]?["Ctv"]?.label, "Ctv")
        XCTAssertEqual( data["Baja"]?["Ctv"]?["123"]?.label, "123")
        
        let ctv = data["Baja"]?["Ctv"]
        XCTAssertEqual( ctv?.numIndividuals, 0 )
        XCTAssertEqual( ctv!, data["Baja"]?["Ctv"] )
        
        
        data.addSubstrata(labels: ["Baja","Ctv","456"], levels: ["Region","Site", "Plot"])
        XCTAssertEqual( data.numSubstrata, 1 )
        XCTAssertEqual( data["Baja"]?.numSubstrata, 1)
        XCTAssertEqual( data["Baja"]?["Ctv"]?.numSubstrata, 2 )
        XCTAssertEqual( data["Baja"]?["Ctv"]?.strataNames, ["123","456"])
        
        data["Baja"]?["Ctv"]?.addSubstrata(labels: ["789"], levels: ["Plot"] )
        XCTAssertEqual( data["Baja"]?["Ctv"]?.numSubstrata, 3 )
        XCTAssertEqual( data["Baja"]?["Ctv"]?.strataNames, ["123","456","789"])
        
        XCTAssertEqual( data["Baja"]?["Ctv"]?["123"]?.numIndividuals, 0)
        try data.addIndividual( Individual.defaultIndividual(), toStrata: "123")
        try data.addIndividual( Individual.defaultIndividual(), toStrata: "123")
        try data.addIndividual( Individual.defaultIndividual(), toStrata: "123")
        XCTAssertEqual( data["Baja"]?["Ctv"]?["123"]?.numIndividuals, 3)
        
        try data.addIndividual( Individual.defaultIndividual(), toStrata: "456")
        try data.addIndividual( Individual.defaultIndividual(), toStrata: "456")
        XCTAssertEqual( data["Baja"]?["Ctv"]?["456"]?.numIndividuals, 2)
        
        
        XCTAssertTrue( data["Baja"]!["Ctv"]!["123"]!.isLocale )
        XCTAssertTrue( data["Baja"]!["Ctv"]!["456"]!.isLocale )
        XCTAssertFalse( data["Baja"]!["Ctv"]!.isLocale )
        
        
        XCTAssertThrowsError( try data.addIndividual( Individual.defaultIndividual(), toStrata: "ABC" ) )
        
        
        let val = data.description
        XCTAssertTrue( !val.isEmpty )
     
        
        
        XCTAssertEqual( data.numIndividuals, 5)
        
        let allInds = data.allIndividuals
        XCTAssertEqual( allInds.count, data.numIndividuals )
        
        for ind in allInds {
            print( "\(ind)")
        }
        
        XCTAssertEqual( data[1], allInds[1])
        XCTAssertNil( data[234] )
        
    }

*/
}
