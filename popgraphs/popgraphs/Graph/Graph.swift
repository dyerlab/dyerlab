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




// MARK: Positioning Nodes

extension Graph {
    
    public func randomizePositions(size: CGSize ) {
        nodes.forEach { $0.randomizeLocation(width: size.width, height: size.height) }
        nodes.forEach { $0.didMove() }
    }
    
    public func shift(x: CGFloat, y: CGFloat ) {
        print("Shifting Graph by: \(x) and \(y)")
        let action = SKAction.move(by: CGVector(dx: x, dy: y), duration: 1)
        nodes.forEach { $0.run(action, completion: $0.didMove) }
    }

    public func getNodeBounds() -> CGRect {
        
        if nodes.count < 1 {
            return CGRect(x: 0, y: 0, width: 0, height: 0)
        }
        
        var ptMn = nodes[0].position
        var ptMx = nodes[0].position
        
        for i in 1..<nodes.count {
            let node = nodes[i]
            let bounds = node.calculateAccumulatedFrame()
            
            if bounds.minX < ptMn.x {
                ptMn.x = (bounds.minX + bounds.size.width) + 50
            } else if bounds.maxX > ptMx.x {
                ptMx.x = bounds.maxX - 50
            }
            
            if bounds.minY < ptMn.y {
                ptMn.y = bounds.minY
            } else if bounds.maxY > ptMx.y {
                ptMx.y = bounds.maxY
            }
        }
        
        return CGRect(x: ptMn.x,
                      y: ptMn.y,
                      width: ptMx.x-ptMn.x,
                      height: ptMx.y-ptMn.y)
    }
    
    
    public func recenterNodes(width: CGFloat, height: CGFloat) {
        
        
        if nodes.count < 1 {
            return
        }
        
        var bounds = self.getNodeBounds()
        bounds.origin.x = bounds.origin.x + 10
        bounds.origin.y = bounds.origin.y + 10
        bounds.size.width = bounds.size.width - 10
        bounds.size.height = bounds.size.height - 10
        
        // figure out   ((bounds.min - pos.x) / bounds.width ) * newWidth = new.x
        nodes.forEach {
            $0.displacement = CGPoint(x: (($0.position.x - bounds.minX) / bounds.width) * width,
                                      y: (($0.position.y - bounds.minY) / bounds.height) * height)
        }
        
        nodes.forEach { $0.move() }
        
    }
    
    
    public func layout() {
        if nodes.count < 1 {
            return
        }
        var dist: CGFloat
        var delta, force: CGPoint
        var temp: CGFloat = 100.0
        let bounds = (nodes[0].parent?.scene?.size)!
        let idealDist: CGFloat = 50.0 * (bounds.width * bounds.height) / CGFloat( nodes.count )

        self.randomizePositions(size: bounds)
        
        print("Layout!!!!")
        
        for iter in 0..<250 {
            print("iter: \(iter) \(temp)")
            
            // Repulsive Forces
            for i in 0..<nodes.count {
                nodes.forEach { $0.displacement = CGPoint(x:0.0, y:0.0) }
                for j in 0..<nodes.count {
                    if i != j {
                        dist = nodes[i].position.distance(to: nodes[j].position )
                        delta = nodes[i].position - nodes[j].position
                        if dist < idealDist {
                            force = delta / dist * ( pow(dist,2.0)/idealDist ) * 5.0
                            nodes[i].displacement = nodes[i].displacement + force 
                        }
                    }
                }
            }
            
            // Attractive Forces
            for i in 0..<edges.count {
                let edge = edges[i]
                delta = edge.node1.position - edge.node2.position
                dist = edge.node1.position.distance(to: edge.node2.position)
                force = delta / dist * ( pow(dist,2.0) / idealDist )
                force = force * edge.weight
                
                edge.node1.displacement = edge.node1.displacement - force
                edge.node2.displacement = edge.node2.displacement + force
            }
            
         
            // Limit movement a bit.
            for node in self.nodes {
                
                
                // Limit by temperature
                if abs( node.displacement.x ) > temp {
                    node.displacement.x = temp * ( abs(node.displacement.x) / node.displacement.x )
                }
                if abs( node.displacement.y ) > temp {
                    node.displacement.y = temp * ( abs(node.displacement.y) / node.displacement.y )
                }
                
                
                // Make sure it is within bounds
                let newPos = node.position + node.displacement

                // Limit X to within bounds
                if newPos.x < 0 {
                    //node.displacement.x = -1.0 * node.position.x + 10.0
                    node.displacement.x = 0.0
                    node.position.x = 40.0
                }
                else if newPos.x > bounds.width {
                    node.displacement.x = bounds.width - node.position.x - 10.0
                }
                
                // Limit Y to within bounds
                if newPos.y < 0 {
                    node.displacement.y = 0.0
                    node.position.y = 40.0
                }
                else if newPos.y > bounds.height {
                    node.displacement.y = bounds.height - node.position.y - 10.0
                }
             
                node.position = node.position + node.displacement
            }
            
            // Cool the annealing
            temp = temp <= 0.5 ? 0.5 : temp * 0.9999
        }
        
        self.recenterNodes(width: bounds.width, height: bounds.height)
        
    }
    
}













extension Graph {

    class func readFromJSON( path: String ) -> Graph? {
        let graph: Graph = Graph()
        
        if let res  = readInJSON(path: path) {            
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
