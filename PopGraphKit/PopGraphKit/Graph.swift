//
//  Graph.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Graph {
    private var vertices: Array<Vertex>
    public var isDirected: Bool
    
    init() {
        vertices = Array<Vertex>()
        isDirected = false
    }
    
    public func addVertex( label: String ) -> Vertex {
        let childVertex = Vertex()
        childVertex.label = label
        self.vertices.append(childVertex)
        return childVertex
    }
    
    public func addEdge( source: Vertex, neighbor: Vertex, weight: Double ) {
        let newEdge = Edge()
        
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        if !isDirected {
            let reverseEdge = Edge()
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append( reverseEdge )
        }
        
    }
}
