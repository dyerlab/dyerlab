//
//  Graph.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MatrixKit

public class Graph {

    public var nodes: [Node]
    public var edges: [Edge]
    public var path: String!
    public var nodeLabels: [String] {
        get {
            return nodes.map { $0.label }
        }
    }
    
    public init() {
        self.nodes = [Node]()
        self.edges = [Edge]()
    }
    

    
    
    
}


// MARK: Adding Nodes & Edges

extension Graph {
    
    public func indexForNode( label: String ) -> Int! {
        return self.nodes.lastIndex(where: { $0.label == label } )
    }
    
    public func addNode( label: String ) {
        self.nodes.append( Node(label: label) )
    }
    
    public func addEdge( from: String, to: String, weight: Double = 1.0) {
        let idx1 = indexForNode(label: from)
        let idx2 = indexForNode(label: to )
        
        if idx1 != nil && idx2 != nil {
            edges.append( Edge(node1: nodes[idx1!],
                               node2: nodes[idx2!],
                               weight: weight)
            )
        }
    }
}




// MARK: Conversion Functions

extension Graph {

    
    public func toMatrix() -> Matrix {
        let N = nodes.count
        var A = Matrix(rows: N, cols: N)
        
        for edge in self.edges {
            
            if let idx1 = nodes.index(of: edge.node1) {
                if let idx2 = nodes.index(of: edge.node2) {
                    A[idx1,idx2] = edge.weight
                }
            }
            
        }
        
        return A
    }
    
}


