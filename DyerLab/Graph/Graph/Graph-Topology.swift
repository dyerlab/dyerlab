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
//  Graph-Topology.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation



extension Graph {
    
    public func shortestPaths() -> Matrix {
        
        let A = self.asMatrix()
        
        let N = A.rows
        let gMax = A.sum
        let D = Matrix(N, N, gMax )
        
        // Set up the return matrix
        for i in 0..<N {
            for j in 0..<N {
                if A[i,j] != 0 {
                    D[i,j] = A[i,j]
                }
            }
        }
        
        // Cycle through it
        for k in 0..<N {
            
            for i in 0..<N {
                for j in 0..<N {
                    
                    if i != j {
                        let curDist = D[i,j]
                        let newDist = D[i,k] + D[k,j]
                        
                        if curDist < gMax && newDist < gMax {
                            D[i,j] = min( curDist, newDist )
                        }
                        else if newDist < gMax {
                            D[i,j] = newDist
                        }
                    }
                }
            }
        }
        
        
        // Go through and set all the gMAX to .infi
        for i in 0..<D.values.count {
            if D.values[i] == gMax {
                D.values[i] = Double.infinity
            }
        }
        
        return D
        
        
    }

}


