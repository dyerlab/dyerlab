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
    var scene: GraphScene
    
    init(scene: GraphScene) {
        self.nodes = Array<Node>()
        self.edges = Array<Edge>()
        self.scene = scene
    }
    
    
}



extension Graph {
    
    public func makeNode( radius: CGFloat, label: String ) {
        let node = Node()
        node.name = label
        node.rescale(radius: radius)
        node.position = CGPoint(x: CGFloat.random(in: 0...self.scene.size.width),
                                y: CGFloat.random(in: 0...self.scene.size.height))
        nodes.append(node)
        scene.addChild(node)
    }
    
    
    public func getNode( label: String ) -> Node? {
        return self.nodes.filter {$0.name == label}.first
    }
    
    public func makeEdge( label1: String, label2: String ) {
        guard let node1 = getNode(label: label1) else { return }
        guard let node2 = getNode(label: label2) else { return }
        let edge = Edge(n1: node1, n2: node2)
        
        self.edges.append(edge)
        scene.physicsWorld.add(edge.spring)
        
    }
    
}
