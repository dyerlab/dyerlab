//
//  FileIOTests.swift
//  PopGenKitTests
//
//  Created by Rodney Dyer on 2/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class FileIOTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testRandom() {
        let pop = makeRandomPopulation()
        XCTAssert(pop.count == 100 )
        
    }

    func testGrabArapat() {
        let pop = loadArapat()
        
        XCTAssertEqual( pop.count,363)
    }
}
