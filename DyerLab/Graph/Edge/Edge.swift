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
//  Edge.swift
//  DLabGraph
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright © 2021 The Dyer Laboratory. All rights reserved.
//

import Foundation


/// A basic edge object
public class Edge {
    
    /// The edge weight
    var weight: Double
    
    /// The node originating the edge
    var from: Node
    
    /// The node terminating the edge
    var to: Node
    
    /// Base initializer for an edge object
    /// - Parameters:
    ///   - from: The starting node
    ///   - to: The ending node
    ///   - weight: The edge weight (default = 1.0)
    init( from: Node, to: Node, weight: Double = 1.0 ) {
        self.from = from
        self.to = to
        self.weight = weight
    }
    
}


extension Edge: CustomStringConvertible {
    public var description: String {
        return String("\(from.label) -> \(to.label)")
    }
}
