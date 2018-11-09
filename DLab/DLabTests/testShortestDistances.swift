//
//  testShortestDistances.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

	

	

class testShortestDistances: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testExample() {
        let G = Graph()
        
        G.addNode( label: "Bob" )
        G.addNode( label: "Alice" )
        G.addNode( label: "Susan" )
        G.addNode( label: "David" )
        
        G.addEdge(from: "Bob", to: "Alice" )
        G.addEdge(from: "Bob", to: "Susan" )
        G.addEdge(from: "Susan", to: "Alice" )
        G.addEdge(from: "David", to: "Susan", weight: 2.0 )
        
        
        let F = ShortestDistanceFloydWarshall(graph: G)
        print(F)
        XCTAssertEqual( F[0,0], 0.0 )
        XCTAssertEqual( F[0,1], 1.0 )
        XCTAssertEqual( F[0,3], 3.0 )
        XCTAssertEqual( F[0,2], 1.0 )
        XCTAssertEqual( F[2,3], 2.0 )
    }

}
