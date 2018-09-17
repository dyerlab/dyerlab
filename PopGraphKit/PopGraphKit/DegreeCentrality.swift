//
//  DegreeCentrality.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/16/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MatrixKit

/**
 Returns a vector of degree values.
 
 - Parameters:
    - graph: A `Graph` object
 
 - Returns: A 1xK matrix of degree for each node
 */
public func degreeCentrality( graph: Graph ) -> Matrix {
    let N = graph.nodes.count
    var ret = Matrix(rows: 1, cols: N)
    var labels = [String]()
    
    for i in 0..<N {
        let node: Node = graph.nodes[i]
        
        labels.append( node.label )
        ret[1,i] = Double(node.degree)
    }
    
    return ret
}
