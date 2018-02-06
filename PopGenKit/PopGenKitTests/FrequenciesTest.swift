//
//  FrequenciesTest.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/5/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class FrequenciesTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInit() {
        let pop = loadArapat()
        let loc1 = pop.getValues(key: "MP20") as! [Locus]
        print("Loc1:")
        print(loc1)
        
        let analysis = Frequencies(loci: loc1,locusName: "MP20")
        analysis.run()
        
        print("Allele frequencies:")
        print(analysis)
        print(analysis.results)
        
        
        //XCTAssert(analysis.getFrequency("1") > 0.52)
        //XCTAssert(analysis.getFrequency("2") < 0.48)
        //XCTAssert(analysis.getHo() < 0.24 )
        //XCTAssert(analysis.getHo() < 0.499 )
        
    }

 

}
