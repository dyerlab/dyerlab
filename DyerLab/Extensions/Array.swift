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
//  Array
//  Array.swift
//
//  Created by Rodney Dyer on 8/20/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

extension Array where Element == CLLocationCoordinate2D {
    
    
    /// Finds the centroid coordinate for an array of values
    /// - Returns: A 4-element tupple of minLon, maxLon, minLat, maxLat
    func bounds() -> (Double, Double, Double, Double) {
        var maxLat: Double = -200;
        var maxLon: Double = -200;
        var minLat: Double = Double(MAXFLOAT);
        var minLon: Double = Double(MAXFLOAT);
        
        for location in self {
            if location.latitude < minLat {
                minLat = location.latitude;
            }
            
            if location.longitude < minLon {
                minLon = location.longitude;
            }
            
            if location.latitude > maxLat {
                maxLat = location.latitude;
            }
            
            if location.longitude > maxLon {
                maxLon = location.longitude;
            }
        }
        
        return (minLon, maxLon, minLat, maxLat )
    }
    
    /// Returns the centroid of the values
    /// - Returns: A ``CLLocationCoordinate2D`` representing the center of the array of values.
    func center() -> CLLocationCoordinate2D {
        
        let range = self.bounds()
        
        return CLLocationCoordinate2DMake( CLLocationDegrees( ( range.2 + range.3 ) * 0.5),
                                           CLLocationDegrees( ( range.0 + range.1 ) * 0.5) );
        
    }
    
    
    
    
 
    
    
    
}

