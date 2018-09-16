//
//  Path.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Path {
    var total: Double
    var destination: Vertex
    var previous: Path?
    
    init() {
        destination = Vertex()
        total = 0.0
    }
}
