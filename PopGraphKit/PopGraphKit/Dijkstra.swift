//
//  Dijkstra.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public func runDijkstra( source: Vertex, destination: Vertex ) -> Path? {
    var frontier = Array<Path>()
    var finalPaths = Array<Path>()
    
    
    // Set up the frontier to iterate through
    for e in source.neighbors {
        
        let newPath = Path()
        newPath.destination = e.neighbor
        newPath.previous = nil
        newPath.total = e.weight
        
        frontier.append(newPath)
    }
    
    var bestPath = Path()
    
    while frontier.count != 0  {
        bestPath = Path()
        var pathIndex: Int = 0
        
        for x in 0..<frontier.count {
            let itemPath = frontier[x]
            
            if bestPath.total == 0.0 || itemPath.total < bestPath.total {
                bestPath = itemPath
                pathIndex = x
            }
        }
        
        for e in bestPath.destination.neighbors {
            let newPath = Path()
            newPath.destination = e.neighbor
            newPath.total = bestPath.total + e.weight
            frontier.append( newPath )
        }
        
        finalPaths.append(bestPath)
        frontier.remove(at: pathIndex )
        
    }
    
    return bestPath
    
}

