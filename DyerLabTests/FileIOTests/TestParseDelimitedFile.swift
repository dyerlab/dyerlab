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
//  TestParseDelimitedFile
//  TestParseDelimitedFile.swift
//
//  Created by Rodney Dyer on 8/30/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest

class TestParseDelimitedFile: XCTestCase {
    
    func testParseDelimitedFile() throws {
        if let path = Bundle.main.path(forResource: "Araptus", ofType: "csv") {
            if let contents = parseDelimitedFile(path: path, delimiter: ",") {
                XCTAssertEqual( contents.count , 366 )
                XCTAssertEqual( contents[0].count, 12)
            } else {
                print("TestParseDelimtedFile::testParseDelimitedFile() contents were not loaded")
            }
        } else {
            print("TestParseDelimtedFile::testParseDelimitedFile() path is nil")
        }
    }
    
}
