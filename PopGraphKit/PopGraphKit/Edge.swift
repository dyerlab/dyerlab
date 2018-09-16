//
//  Edge.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Edge {
    var neighbor: Vertex
    var weight: Double
    
    init() {
        self.weight = 0.0
        self.neighbor = Vertex()
    }
}
