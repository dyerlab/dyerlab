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
//  StratumOverlay
//  StratumOverlay.swift
//
//  Created by Rodney Dyer on 8/30/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import MapKit

// https://www.raywenderlich.com/9956648-mapkit-tutorial-overlay-views

public class StratumOverlay: NSObject, MKOverlay {
    public let coordinate: CLLocationCoordinate2D
    public let boundingMapRect: MKMapRect
        
    init( stratum: Stratum ) {
        self.coordinate = stratum.centroid
        self.boundingMapRect = stratum.mapRect
    }
}
