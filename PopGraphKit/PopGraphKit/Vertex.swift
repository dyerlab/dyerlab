//
//  Vertex.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


public class Vertex {
    
    var label: String?
    var neighbors: Array<Edge>
    
    init() {
        self.neighbors = Array<Edge>()
    }
}
