//
//  Graph.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init() {
        self.nodes = Array<Node>()
        self.edges = Array<Edge>()
    }
    
    
}



extension Graph {
    
    public func makeNode( radius: CGFloat, label: String ) {
        let node = Node(label: label, size: radius)
        node.name = label
        nodes.append(node)
    }
    
    
    public func getNode( label: String ) -> Node? {
        return self.nodes.filter {$0.name == label}.first
    }
    
    public func makeEdge( label1: String, label2: String, weight: CGFloat ) {
        guard let node1 = getNode(label: label1) else { return }
        guard let node2 = getNode(label: label2) else { return }
        let edge = Edge(n1: node1, n2: node2, weight: weight)
        self.edges.append(edge)
    }
    
}




extension Graph {
    
    public func randomizePositions(size: CGSize ) {
        nodes.forEach { $0.randomizeLocation(width: size.width, height: size.height) }
        nodes.forEach { $0.didMove() }
    }

}
