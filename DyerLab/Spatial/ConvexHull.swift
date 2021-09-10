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
//  ConvexHull
//  ConvexHull.swift
//
//  Created by Rodney Dyer on 8/23/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

public class ConvexHull {
    
    var convexHull = [CLLocationCoordinate2D]()
    var polygon: MKPolygon {
        return MKPolygon(coordinates: convexHull, count: convexHull.count)
    }
    
    /// https://www.appcoda.com/mapkit-polyline-polygon/
    /// https://www.raywenderlich.com/9956648-mapkit-tutorial-overlay-views
    
    enum ClockwiseOrientation {
        case colinear
        case clockwise
        case counterclockwise
    }
    
    
    
    
    init( pts: [CLLocationCoordinate2D]) {
        findHull(points: pts )
    }
    
    private func leftmostIndex( coords: [CLLocationCoordinate2D] ) -> Int {
        var mnIdx = 0
        for i in 1 ..< coords.count {
            if coords[i].longitude < coords[mnIdx].longitude {
                mnIdx = i
            } else if coords[i].longitude == coords[i].longitude {
                if coords[i].latitude > coords[mnIdx].latitude {
                    mnIdx = i
                }
            }
        }
        
        return mnIdx
    }
    
    
    private func orientation(p: CLLocationCoordinate2D, q: CLLocationCoordinate2D, r: CLLocationCoordinate2D) -> ClockwiseOrientation {
        
        let val = (q.latitude - p.latitude) * (r.longitude - q.longitude) - (q.longitude - p.longitude) * (r.latitude - q.latitude)
        
        if val == 0 {
            return .colinear
        } else if val > 0 {
            return .clockwise
        } else {
            return .counterclockwise
        }
        
    }
    
    private func findHull( points: [CLLocationCoordinate2D] ) {
        let n = points.count
        
        
        // Must have at least 3 points to make a hull
        if n < 3 {
            return
        }
        
        let leftIdx = leftmostIndex(coords: points )
        
        var p = leftIdx
        var q = 0
        
        repeat {
            self.convexHull.append( points[p] )
            
            q = (p+1) % points.count
            for i in 0 ..< n {
                if orientation(p: points[p], q: points[i], r: points[q]) == .counterclockwise {
                    q = i
                }
            }
            p = q
        } while p != leftIdx

           
        
    }
    
}
