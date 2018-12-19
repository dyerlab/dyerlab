//
//  GraphOps.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/5/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

func calculateNodeForces( graph: Graph, temperature: CGFloat ) -> Bool {
    assert( graph.nodes.count > 0 )
    var ret = false
    
    let K = CGFloat( pow( 1000.0 / Double(graph.nodes.count ), 1.0/3.0 ) * 50.0 )

    
    
    for (_, node) in graph.nodes.enumerated() {
        
        var vel = SCNVector3Zero
    
        
        // Repulsive Forces
        for(_, othernode) in graph.nodes.enumerated() {
            let delta = node.position - othernode.position
            let l = (delta.x * delta.x + delta.y * delta.y + delta.z * delta.z ) * 4.0
            if l > 0 {
                vel = vel + ((delta/l) * (K*K/l))
            }
        }
        
        
        // Attractive Forces
        for(_,edge) in node.edges.enumerated() {
            let other = edge.otherNode(node: node)
            let delta = (other.position - node.position  ) / (10.0 * edge.weight!)
            vel = vel + delta
        }
        
        // correct for out of scene stuff
        if abs(vel.x) > temperature {
            vel.x = temperature * vel.x / abs(vel.x)
        }
        if abs(vel.y) > temperature {
            vel.y = temperature * vel.y / abs(vel.y)
        }
        if abs(vel.z) > temperature {
            vel.z = temperature * vel.z / abs(vel.z)
        }
        
        if vel.length() > 0 {
            ret = true
        }
        
        vel = vel.normalized()
        
        node.shift(displacement: vel)
    }
    
    
    
    // Attractive Forces
    
    
    return ret
}




func minimizeSpring( graph: Graph ) {
    
    let K = CGFloat( sqrt( (20.0 * 20 * 20) / Float(graph.nodes.count)) )
    var temp = CGFloat( 100.0 )
    
    graph.nodes.forEach( { node in
        node.location = node.position
    })
    
    for _ in 0..<100 {
        
        //print("iteration \(iter)----------------------------------------")
        
        var centroid = SCNVector3Zero
        
        // Repulsive Forces
        for (_,node1) in graph.nodes.enumerated() {
            
            node1.displacement = SCNVector3Zero
            
            for (_, node2) in graph.nodes.enumerated() {
                if node1 != node2 {
                    var delta = node1.location - node2.location
                    var dist = CGFloat(delta.length())
                    if dist == 0.0 {
                        dist = 1.0
                    }
                    if dist <= K {
                        delta = delta / dist * ((K*K)/dist)
                        node1.displacement = node1.displacement + delta
                    }
                }
            }
        }
        
        // Attractive Forces
        for (_,edge) in graph.edges.enumerated() {
            
            let delta = (edge.node1?.location)! - (edge.node2?.location)!
            var dist = CGFloat( delta.length() )
            if dist == 0.0 {
                dist = 1.0
            }
            dist = CGFloat( sqrt( dist ) )
            
            var force = delta / dist * ( dist * dist / K)
            force = force * (edge.weight ?? 1.0)
            
            edge.node1?.displacement = (edge.node1?.displacement)! - force
            edge.node2?.displacement = (edge.node2?.displacement)! + force
            
        }
        
        // Limit Movement
        for (_,node) in graph.nodes.enumerated() {
            
            let x = node.displacement.x
            let y = node.displacement.y
            let z = node.displacement.z
            
            print(node.displacement)
            
            if x != 0 {
                node.displacement.x = min( temp, abs(x) ) * ( x / abs(x) )
            }
            if y != 0 {
                node.displacement.y = min( temp, abs(y) ) * ( y / abs(y) )
            }
            if z != 0 {
                node.displacement.z = min( temp, abs(z) ) * ( z / abs(z) )
            }
            
            //print(node.location)
            //print(node.displacement)
            
            node.location = node.location + node.displacement
            node.displacement = SCNVector3Zero
            node.location = limit(vec: node.location, mn: -100, mx: 100)
            //print(node.location)
            //print(" ")
            
            centroid = centroid + node.location
        }
        
        centroid = centroid / CGFloat( graph.nodes.count )
        
        graph.nodes.forEach( { node in
            node.location = node.location - centroid
        })
        
        temp = (temp <= 1) ? 1.0 : temp * 0.95
    }
    
    
    // move the nodes
    for (_, node) in graph.nodes.enumerated() {
        let dist  = (node.location - node.position).length() / 30.0
        let action = SCNAction.move(to: node.location, duration: TimeInterval(dist))
        node.runAction(action)
        
    }
}
