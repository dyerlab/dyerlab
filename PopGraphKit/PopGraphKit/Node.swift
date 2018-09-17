//
//  Vertex.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

public class Node {
    
    public var label: String
    public var edges: Array<Edge>
    public var degree: Int {
        get {
            return edges.count
        }
    }
    
    init(label: String) {
        self.label = label
        self.edges = Array<Edge>()
    }
    
    
}



extension Node: Equatable {
    public static func ==(left: Node, right: Node ) -> Bool {
        return left.label == right.label && left.edges == right.edges
    }
}

