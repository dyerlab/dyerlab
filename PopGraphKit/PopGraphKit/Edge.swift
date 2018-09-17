//
//  Edge.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Edge {
    public var node1: Node
    public var node2: Node
    public var weight: Double
    
    init(node1: Node, node2: Node, weight: Double = 1.0) {
        self.weight = weight
        self.node1 = node1
        self.node2 = node2
    }
}


extension Edge : Equatable {
    
    public static func ==(left: Edge, right: Edge ) -> Bool {
        return left.node1 == right.node1 && left.node2 == right.node2
    }
}

