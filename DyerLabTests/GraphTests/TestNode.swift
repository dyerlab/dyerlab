//
//  TestNode.swift
//  DLabGraphTests
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright © 2021 The Dyer Laboratory. All rights reserved.
//

import XCTest

class TestNode: XCTestCase {

    
    func testInit() throws {
        
        let node1 = Node(size: 24.0, label: "Bob")
        XCTAssertEqual( node1.size, 24.0 )
        XCTAssertEqual( node1.label, "Bob" )
        XCTAssertEqual( node1.edges.count, 0 )
        XCTAssertTrue( node1.position.sum == 0.0 )
        XCTAssertEqual( node1.displacement, zeros(3) )
        XCTAssertTrue( node1.id.uuidString.count > 0 )
        XCTAssertEqual( node1, node1 )
        XCTAssertEqual( node1.description, "Bob:")
        
        
        let node2 = Node(size: 42.0, label: "Alice" )
        XCTAssertNotEqual( node1, node2 )
        
        let edge = Edge(from: node1, to: node2, weight: 23.0)
        node1.edges.append( edge )
        XCTAssertEqual( node1.description, "Bob: -> Alice")
        
        
        
    }


}
