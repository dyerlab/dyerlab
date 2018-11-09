//
//  DegreeCentrality.swift
//  DLab
//
//  Created by Rodney Dyer on 9/16/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
 

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
        ret[0,i] = Double(node.degree)
    }
    
    ret.colNames = labels
    
    return ret
}



/**
 Returns closeness Centrality
 
 - Parameters:
 - graph: A `Graph` object
 
 - Returns: A 1xK `Matrix`
 */
public func closenessCentrality( graph: Graph ) -> Matrix {
    let N = graph.nodes.count
    var ret = Matrix(rows: 1, cols: N)
    var labels = [String]()
    let D = ShortestDistanceFloydWarshall(graph: graph)
    
    for i in 0..<N {
        if D.colNames.count > 0 {
            labels.append( D.colNames[i])
        }
        for j in 0..<N {
            if D[i,j] != Double.infinity {
                ret[0,i] = D[i,j] + ret[0,i]
            }
        }
    }
    
    ret.colNames = labels
    
    return ret
}




/**
 Returns closeness Centrality
 
 - Parameters:
 - graph: A `Graph` object
 
 - Returns: A 1xK `Matrix`
 */
public func betweenessCentrality( graph: Graph ) -> Matrix {
    let N = graph.nodes.count
    var ret = Matrix(rows: 1, cols: N)
    var labels = [String]()
    
    var D = Matrix( matrix: graph.toMatrix() )
    let gMax = D.sum() + 1.0
    D.values = D.values.map { $0 != 0 ? $0 : gMax }
    
    for k in 0..<N {
            labels.append( D.colNames[k])
        
        for i in 0..<N {
            for j in 0..<N {
                if i != j  {
                    let newDist = D[i,k] + D[k,j]
                    
                    if newDist < gMax {
                        if D[i,j] > newDist {
                            ret[0,k] = 1.0 + ret[0,k]
                            D[i,j] = newDist
                        }
                        else {
                            D[i,j] = newDist
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    ret.colNames = labels
    return ret
}
