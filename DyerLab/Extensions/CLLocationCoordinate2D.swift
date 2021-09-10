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
//  DLab
//  CLLocationCoordinate2D.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit


extension CLLocationCoordinate2D {
    
    /// Distance from self to a point defined by the two passed lines.
    public func distanceToLine( pt1: CLLocationCoordinate2D, pt2: CLLocationCoordinate2D ) -> Double {
        if pt1 == pt2 {
            return sqrt( pow( self.longitude - pt1.longitude, 2 ) + pow( self.latitude - pt1.latitude, 2 ) )
        } else {
            return abs( ( pt2.latitude - pt1.latitude) * self.longitude 
                       - (pt2.longitude - pt1.longitude ) * self.latitude
                       +  pt2.longitude * pt1.latitude
                       -  pt2.latitude * pt1.longitude)
            / sqrt( pow( pt2.latitude - pt1.latitude, 2 ) + pow( pt2.longitude - pt1.longitude , 2))
        }
    }
    
}


/// Vector deviation between two points
/// - Parameters:
///   - lhs: The left coordinate
///   - rhs: The right coordinate
/// - Returns: The `CLLocationCoordiante2D` resulting from the subtraction of both individual coordinates.
public func -(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D ) -> CLLocationCoordinate2D {
    CLLocationCoordinate2DMake( lhs.latitude - rhs.latitude, lhs.longitude - rhs.longitude)
}




public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}


