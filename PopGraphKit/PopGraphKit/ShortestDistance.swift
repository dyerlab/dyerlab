//
//  FloydWarshallDistance.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/16/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MatrixKit

public func ShortestDistanceFloydWarshall( graph: Graph ) -> Matrix {
    let A = graph.toMatrix()
    let gMax = A.sum()
    let N = A.rows
    var D = Matrix(rows: N, cols: N)
    
    D.values = A.values.map { $0 == 0 ? gMax : $0}
    D.colNames = A.colNames
    
    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                if i != j {
                    let newDist = D[i,k] + D[k,j]
                    if newDist < gMax  {
                        D[i,j] = D[i,j] < gMax ? min( D[i,j], newDist ) : newDist
                    }
                }
                else {
                    D[i,j] = 0.0
                }
            }
        }
    }
    
    // Make gMax values Double.infinity
    D.values = D.values.map { $0 == gMax ? Double.infinity : $0 }
    
    
    return D
}
