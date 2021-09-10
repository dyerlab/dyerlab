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
//  TestConvexHull
//  TestConvexHull.swift
//
//  Created by Rodney Dyer on 8/23/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import XCTest
import MapKit

class TestConvexHull: XCTestCase {



    func testExample() throws {
        
        let lat = [3.0,2,1,1,0,0,3]
        let lon = [0.0,2,1,2,3,0,3]
        var coords = [CLLocationCoordinate2D]()
        
        for i in 0 ..< lat.count {
            coords.append( CLLocationCoordinate2D(latitude: lat[i], longitude: lon[i]))
        }
        
        let hull = ConvexHull( pts: coords )
        
        XCTAssertEqual( hull.convexHull.count, 4 )
        
        // let poly = hull.convexHull
        for coord in hull.convexHull {
            print( "\(coord.longitude) \(coord.latitude)")
        }
        
        
        
    }

}
