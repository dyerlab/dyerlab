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
    
    init() {
        self.nodes = [Node]()
        self.edges = [Edge]()
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
