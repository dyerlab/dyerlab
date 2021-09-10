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
//  TestIndividual.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest
import MapKit

class TestIndividual: XCTestCase {


    func testExample() throws {
        
        let mom = Individual.exampleIndividual()
        
        XCTAssertEqual( mom.numLoci, 3 )
        XCTAssertEqual( mom.getLocus(name: "TPI"), Locus(left: "A", right: "a") )
        XCTAssertEqual( mom.getLocus(name: "Bob"), Locus() )
        XCTAssertEqual( mom.coordinate.latitude, 37.0 )
        XCTAssertEqual( mom.coordinate.longitude, -77.0 )
        
        let coord = CLLocationCoordinate2DMake(37.7, -77.7)
        mom.coordinate = coord
        XCTAssertEqual( mom.coordinate.latitude, 37.7 )
        
        
        print("\(mom)")
        
        let off = Individual(latitude: 37, longitude: -77)
        off.addLocus(name: "TPI", allele1: "A", allele2: "a")
        off.addLocus(name: "MP1", allele1: "B", allele2: "b")
        off.addLocus(name: "AAT", allele1: "C", allele2: "C")
        XCTAssertEqual( off.numLoci, 3)
        XCTAssertEqual( off.locusNames, ["AAT","MP1","TPI"])
        
        
        // Trying to do 
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode( mom )
        print(String(data: data, encoding: .utf8)!)
        let decoder = JSONDecoder()
        let mom2 = try decoder.decode(Individual.self, from: data)
        XCTAssertEqual( mom, mom2  )
        
        
    }

}
