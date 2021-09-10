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
//  Graph-Layout.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation

extension Graph {
    
    
    /// This function will minimize the spring tension in the network in
    ///  2 or 3- dimensions
    /// - Parameter dim: The number of dimensions to simulate
    public func minimizeSpring( dim: Int  ) {
        var temp : Double = 100.0
        let iter: Int = 100
        let N = nodes.count
        let K =  1.0 / sqrt( Double( N ) )
        

        // Place the nodes in random space [-50,50]
        for i in 0..<nodes.count {
            nodes[i].position = randomVector(dim) * 100.0 - 50.0
        }
        self.centerNodes()
        
        // cycle through the iterations
        for _ in 0..<iter {
            
            
            // Set displacement to zero
            nodes.forEach { node in
                node.displacement = zeros(dim)
            }
            
            print(" --- Centroid: \(self.centroid()) ")
            
            
            // Repulsive forces
            for i in 0 ..< N {
                for j in 0 ..< N {
                    if i != j {
                        let delta = nodes[i].position - nodes[j].position
                        let mag = delta.magnitude > 1.0 ? delta.magnitude : 1.0
                        let force = delta.normal * (pow(K,2) / mag )
                        nodes[i].displacement = nodes[i].displacement + ( force * 4.0 )
                        
                    }
                }
            }
            
            
            
            // Attractive Forces
            for node in nodes {
                for edge in node.edges {
                    let delta = node.position - edge.to.position
                    let mag = delta.magnitude > 1.0 ? delta.magnitude : 1.0
                    let force = delta.normal * pow(mag,2) / (K  * edge.weight)
                    
                    edge.from.displacement = edge.from.displacement - force
                    edge.to.displacement = edge.to.displacement + force
                }
            }
            
            // Limit the movement, constrain, center, and reset
            for node in nodes {
                node.position = node.position + node.displacement.limitAnnealingMagnitude(temp: temp/2.0)
                node.position = node.position.constrain(minimum: -50.0, maximum: 50.0)
                node.displacement = zeros(dim)
            }
            
            centerNodes()
            
            
            temp = temp > 1 ? 0.95 * temp : 1.0
            
        }
    }
    
    public func centroid() -> Vector {
        var mu = Vector(repeating: 0.0, count: nodes.first!.position.count)
        for node in nodes {
            mu = mu + node.position
        }
        mu = mu / Double( nodes.count )
        return mu
    }
    
    
    public func centerNodes() {
        let mu = centroid()
        nodes.forEach{ node in
            node.position = node.position - mu
        }
    }
    
    public func coordsForR() {
        var ret = "coords <- matrix( c( "
        
        nodes.forEach{ node in
            for i in 0 ..< node.position.count {
                ret += String("\(node.position[i]), ")
            }
        }
        let endIndex = ret.index(ret.endIndex, offsetBy: -2)
        ret = String( ret[..<endIndex] )
        ret += "), ncol=2, byrow=TRUE)"
        print( ret )
    }
    
    public func dumpCoords() {
        for node in nodes {
            print( node.position )
        }
    }
    
}
