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
//  Mappable.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit


protocol Mappable {
    
    /// The thing should be able to give out a region
    var region: MKCoordinateRegion { get }
    
    /// The object should provide one or more items
    var markers: [Place] { get }
    
}
