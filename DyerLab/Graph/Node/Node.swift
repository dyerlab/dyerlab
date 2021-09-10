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
//  Node.swift
//
//  Created by Rodney Dyer on 6/30/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation

/// Base Class for 2- and 3-d nodes
public class Node {
    
    /// A Unique ID
    var id: UUID
    
    /// The radius of the node
    var size: Double
    
    /// The label on the node
    var label: String
    
    ///  The displacement of the node from idealized loacation
    var displacement: Vector
    
    /// The position of the node
    var position: Vector
    
    /// Edges on this node
    var edges: [Edge]
    
    
    /// Default initializer
    ///
    /// - Parameters:
    ///     - size: The radius of the node
    ///     - label: The name to display around the node
    init( size: Double = 1.0, label: String = "Node" ) {
        self.id = UUID()
        self.edges = [Edge]()
        self.size = size
        self.label = label
        self.displacement = zeros(3)
        self.position = zeros( 3 ) 
    }
    
    

}



// MARK: - CustomStringConvertable
extension Node: CustomStringConvertible {
    
    public var description: String {
        var ret = String("\(label):")
        for edge in self.edges {
            ret += String(" -> \(edge.to.label)")
        }
        return ret
    }
    
}





// MARK: - Making Nodes Equatable
extension Node: Equatable {
    
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.id == rhs.id
    }

    
}







