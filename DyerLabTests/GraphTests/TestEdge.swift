//
//  TestEdge.swift
//  DLabGraphTests
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright © 2021 The Dyer Laboratory. All rights reserved.
//

import XCTest

class TestEdge: XCTestCase {


    func testInit() throws {
        let node1 = Node(size: 24.0, label: "Bob")
        let node2 = Node(size: 42.0, label: "Alice" )
        let edge = Edge(from: node1, to: node2, weight: 42.0)
        
        
        XCTAssertEqual( edge.from.id, node1.id )
        XCTAssertEqual( edge.to.id, node2.id )
        XCTAssertEqual( edge.weight, 42.0 )
        XCTAssertEqual( edge.description, "Bob -> Alice")
        
        
    }

}
