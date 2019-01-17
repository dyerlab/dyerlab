//
//  Graph.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit
import MapKit

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













extension Graph {

    class func readFromJSON( path: String ) -> Graph? {
        let graph: Graph = Graph()
        
        if let res  = readInJSON(path: path) {
            print( res.keys )
            
            let nodes = res["nodes"] as! [Any]
            for i in 0..<nodes.count {
                let d = nodes[i] as! [String:Any]
                let label: String = (d["name"] as? String) ?? String("node-\(i)")
                let size: CGFloat = (d["size"] as? CGFloat) ?? 1.0
                let node = Node(label: label, size: size)
                
                let keys = Array(d.keys)
                let properties = ["name","size"].difference(from: keys)
                for key in properties {
                    node.setProperty(key: key, value: d[key]!)
                }
                print("Created Node")
                print(node)
                graph.nodes.append(node)
            }
            
            let edges = res["links"] as! [Any]
            for i in 0..<edges.count {
                let d = edges[i] as! [String:Any]
                let target: Int = (d["target"] as? Int) ?? -1
                let source: Int = (d["source"] as? Int) ?? -1
                let weight: CGFloat = (d["weight"] as? CGFloat) ?? 1.0
                if target > 0 && source > 0 {
                    let edge = Edge(n1: graph.nodes[source],
                                    n2: graph.nodes[target],
                                    weight: weight)
                    graph.edges.append(edge)
                }
            }
        }
        return graph
    }
    
}
