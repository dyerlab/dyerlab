//
//  testEdge.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/18/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGraphKit

class testEdge: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {

    }

    func testExample() {

        let n1 = Node(label: "A")
        let n2 = Node(label: "A")
        let n3 = Node(label: "B")
        
        XCTAssertEqual(n1,n2)
        XCTAssertNotEqual(n1,n3)
        
        let e1 = Edge(node1: n1, node2: n2 )
        let e2 = Edge(node1: n1, node2: n2 )
        
        XCTAssertEqual( e1, e2 )
        XCTAssertEqual( n1, n2 )
        
        let e3 = Edge( node1: n3, node2: n2, weight: 2.0)
        XCTAssertNotEqual(e1,e3)
        
    }

}
