//
//  Sample.swift
//  taxa
//
//  Created by Rodney Dyer on 2/25/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

class Sample {
    let name: String
    let coord: CLLocationCoordinate2D
    var notes: String
    let measurements: [String: Double]
    
    init(name: String, coord: CLLocationCoordinate2D, notes: String) {
        self.name = name
        self.coord = coord
        self.notes = notes
        self.measurements = [String:Double]()
    }
}

