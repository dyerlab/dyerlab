//
//  SNPTests.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/6/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class SNPTests: XCTestCase {
    

    

    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testInit() {
        let raw1 = "0/0:15:15,0"
        let raw2 = "0/1:15:6,9"
        let raw3 = "./.:0:.,."
        let alleles = ["C","T"]
        
        let snp1 = SNP(raw: raw1, alleles: alleles)
        let snp2 = SNP(raw: raw2, alleles: alleles)
        let snp3 = SNP(raw: raw3, alleles: alleles)
       
        print("----------SNP Test-------------------------------")
        print("snp1: \(snp1)")
        print("snp2: \(snp2)")
        print("snp3: \(snp3)")
        
        XCTAssertFalse( snp1.isEmpty() )
        XCTAssertFalse( snp2.isEmpty() )
        XCTAssertTrue( snp3.isEmpty() )
        
        
        XCTAssertFalse( raw1 == raw2 )
    }

}
