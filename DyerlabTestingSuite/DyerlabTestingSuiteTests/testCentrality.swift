//
//  testCentrality.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import MatrixKit
import PopGraphKit

class testCentrality: XCTestCase {
    var G: Graph!
    
    override func setUp() {
        G = Graph()
        
        G.addNode( label: "Bob" )
        G.addNode( label: "Alice" )
        G.addNode( label: "Susan" )
        G.addNode( label: "David" )
        
        G.addEdge(from: "Bob", to: "Alice" )
        G.addEdge(from: "Bob", to: "Susan" )
        G.addEdge(from: "Susan", to: "Alice" )
        G.addEdge(from: "David", to: "Susan", weight: 2.0 )
    }

    override func tearDown() {
    }

    func testDegreeCentrality() {
        let D = degreeCentrality(graph: G!)
        
        print("Degree Centrality:")
        print(D)
        
        XCTAssertEqual( D.rows, 1 )
        XCTAssertEqual( D.cols, 4 )
        XCTAssertEqual( D[0,0], 2.0 )
        XCTAssertEqual( D[0,1], 2.0 )
        XCTAssertEqual( D[0,2], 3.0 )
        XCTAssertEqual( D[0,3], 1.0 )
        XCTAssertEqual( D.colNames[0], "Bob")
        XCTAssertEqual( D.colNames[1], "Alice")
        XCTAssertEqual( D.colNames[2], "Susan")
        XCTAssertEqual( D.colNames[3], "David")
    }
    
    
    func testClosenessCentrality() {
        let D = closenessCentrality(graph: G!)
        print("Closeness Centrality")
        print(D)
        XCTAssertEqual( D.rows, 1 )
        XCTAssertEqual( D.cols, 4 )
        XCTAssertEqual( D[0,0], 5.0 )
        XCTAssertEqual( D[0,1], 5.0 )
        XCTAssertEqual( D[0,2], 4.0 )
        XCTAssertEqual( D[0,3], 8.0 )
        XCTAssertEqual( D.colNames[0], "Bob")
        XCTAssertEqual( D.colNames[1], "Alice")
        XCTAssertEqual( D.colNames[2], "Susan")
        XCTAssertEqual( D.colNames[3], "David")
        
    }
    
    
    func testBetweennessCentrality() {
        let D = betweenessCentrality(graph: G!)
        print("Betweenness Centrality")
        print(D)
        
        XCTAssertEqual( D.rows, 1 )
        XCTAssertEqual( D.cols, 4 )
        XCTAssertEqual( D[0,0], 0.0 )
        XCTAssertEqual( D[0,1], 0.0 )
        XCTAssertEqual( D[0,2], 4.0 )
        XCTAssertEqual( D[0,3], 0.0 )
        XCTAssertEqual( D.colNames[0], "Bob")
        XCTAssertEqual( D.colNames[1], "Alice")
        XCTAssertEqual( D.colNames[2], "Susan")
        XCTAssertEqual( D.colNames[3], "David")
    }

}
