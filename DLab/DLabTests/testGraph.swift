//
//  testGraph.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/18/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest

	

	

class testGraph: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        
        XCTAssertEqual(G.indexForNode(label: "Bob")!, 0)
        XCTAssertEqual(G.indexForNode(label: "Susan")!, 2)
        
        let A = G.toMatrix()
        XCTAssertEqual(A.cols, A.rows)
        XCTAssertEqual(A.cols, 4)
        
        var B = Matrix(rows: 4, cols: 4)
        B[0,1] = 1.0
        B[1,0] = 1.0
        B[0,2] = 1.0
        B[2,0] = 1.0
        B[1,2] = 1.0
        B[2,1] = 1.0
        B[2,3] = 2.0
        B[3,2] = 2.0
        
        XCTAssertEqual(A,B)
        
    }

}
