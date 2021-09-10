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
//  TestDataSet
//  TestDataSet.swift
//
//  Created by Rodney Dyer on 8/30/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest

class TestDataSet: XCTestCase {

    func testInit() throws {

           
        let testData = DataSet()
        XCTAssertEqual( testData.count, 0 )
        XCTAssertEqual( testData.levels, ["All"])

    }
    
    
    func testDefault() throws {
        let theData = DataSet.defaultDataSet()
        print("\(theData)")
        XCTAssertEqual( theData.count, 365 )

        
    }


}
