//
//  testGraph.swift
//  DyerlabTestingSuiteTests
//
//  Created by Rodney Dyer on 9/18/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import XCTest
import PopGraphKit

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
        G.addEdge(from: "David", to: "Susan" )
        
        
    }

}
