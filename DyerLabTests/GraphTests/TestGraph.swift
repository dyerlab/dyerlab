//
//  TestGraph.swift
//  DLabGraphTests
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright © 2021 The Dyer Laboratory. All rights reserved.
//

import XCTest

class TestGraph: XCTestCase {

    private var graph: Graph!

    override func setUpWithError() throws {
        graph = Graph()
        
        graph.addNode(label: "A", size: 1.0)
        graph.addNode(label: "B", size: 1.0)
        graph.addNode(label: "C", size: 1.0)
        graph.addNode(label: "D", size: 1.0)
        graph.addNode(label: "E", size: 1.0)
        graph.addNode(label: "F", size: 1.0)
        
        graph.addEdge(from: "A", to: "B", weight: 4)
        graph.addEdge(from: "A", to: "C", weight: 2)
        graph.addEdge(from: "B", to: "C", weight: 5)
        graph.addEdge(from: "B", to: "D", weight: 10, symmetric: true )
        graph.addEdge(from: "C", to: "E", weight: 3)
        graph.addEdge(from: "E", to: "D", weight: 4)
        graph.addEdge(from: "D", to: "F", weight: 11)
    }
    
    override func tearDownWithError() throws {
        graph = nil
    }
    
    
    func testInit() throws {
        
        XCTAssertEqual( graph.count, 6)
        XCTAssertEqual( graph.getNode(label: "A"), graph.nodes[0] )
        XCTAssertEqual( graph.getNode(label: "Bob"), nil )
        XCTAssertEqual( graph.getNodeIndex(label: "A"), 0 )
        XCTAssertEqual( graph.getNodeIndex(label: "Bob"), nil )
        
        let desc = "Graph = [\n A: -> B -> C\n B: -> C -> D\n C: -> E\n D: -> B -> F\n E: -> D\n F:\n]\n"

        XCTAssertEqual( graph.description, desc )
        
        let A = graph.asMatrix()
        let Aexp = Matrix( 6, 6, [0.0, 4.0, 2.0, 0.0, 0.0, 0.0,
                                  0.0, 0.0, 5.0, 10.0, 0.0, 0.0,
                                  0.0, 0.0, 0.0, 0.0, 3.0, 0.0,
                                  0.0, 10.0, 0.0, 0.0, 0.0, 11.0,
                                  0.0, 0.0, 0.0, 4.0, 0.0, 0.0,
                                  0.0, 0.0, 0.0, 0.0, 0.0, 0.0] )
        
        XCTAssertEqual( A, Aexp )
        
    }
    
    
    func testShortestPath() throws {
        let D = graph.shortestPaths()
        XCTAssertEqual( D.rows, 6 )
        XCTAssertEqual( D.cols, 6 )
        print(D)
        
        XCTAssertEqual( D[0,5], 20.0 )
    }

    
    func testCentering() throws {
        let mu0 = graph.centroid()
        graph.centerNodes()
        let mu1 = graph.centroid()
        
        XCTAssertEqual( abs(mu0.sum), abs(mu1.sum) )
        XCTAssertTrue( abs(mu1.magnitude) < 0.0000001 )
    }

    func testMinimizeSpring() throws {
        
        //graph.dumpCoords()
        
        graph.minimizeSpring(dim: 3)

        //graph.dumpCoords()
        
        //graph.coordsForR()
        
    }
}


