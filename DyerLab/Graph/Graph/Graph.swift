//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  DLabGraph
//  Graph.swift
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation
import CoreGraphics


public class Graph {
    
    var nodes: [Node]
    var count: Int {
        get {
            return nodes.count
        }
    }
    var dimension: Double {
        get {
            return Double( nodes.map{ Double($0.position.count)}.reduce(0.0, +) ) / Double( nodes.count )
        }
    }
    
    
    
    init() {
        self.nodes = [Node]()
    }
    
    func getNode( label: String ) -> Node? {
        return self.nodes.filter { $0.label == label }.first
    }
    
    func getNodeIndex( label: String ) -> Int? {
        if let node = getNode(label: label) {
            return nodes.firstIndex(of: node )
        }
        
        
        return nil
        
    }
    
    
    func addNode( label: String, size: Double ) {
        self.nodes.append( Node(size: size, label: label) )
    }
    
    
    func addEdge(from: String, to: String, weight: Double, symmetric: Bool = false  ) {
        
        if let node1 = getNode(label: from) {
            if let node2 = getNode(label: to) {
                node1.edges.append( Edge(from: node1, to: node2, weight: weight) )
                if symmetric {
                    node2.edges.append( Edge(from: node2, to: node1, weight: weight))
                }
            }
        }
        
    }
    
    
}



// MARK: - CustomStringConvertable
extension Graph: CustomStringConvertible {
    public var description: String {
        var ret = "Graph = [\n"
        for node in nodes {
            ret += String(" \(node)\n")
        }
        ret += "]\n"
        return ret
    }
}



// MARK: - Make it matrix aware
extension Graph: MatrixConvertable {
    
    public func asMatrix() -> Matrix {
        let N = nodes.count
        let A = Matrix(N,N)
        
        for node in nodes {
            if let idx1 = getNodeIndex(label: node.label)  {
                for edge in node.edges {
                    if let idx2 = getNodeIndex(label: edge.to.label ) {
                        A[idx1,idx2] = edge.weight
                    }
                }
            }
        }
        A.rowNames = nodes.map { $0.label } as [String]
        A.colNames = A.rowNames
        
        return A
    }
}

