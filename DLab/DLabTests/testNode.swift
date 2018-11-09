//
//  testNode.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

class testNode: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNode() {
        
        let theNode = Node(label: "The Node")
        
        XCTAssertEqual(theNode.degree, 0)
        XCTAssertEqual(theNode.label, "The Node")
    }
    
    func testEquality() {
        let n1 = Node(label: "A")
        let n2 = Node(label: "B")
        
        XCTAssertEqual(n1,n1)
        XCTAssertNotEqual(n1,n2)
        
    }

}
