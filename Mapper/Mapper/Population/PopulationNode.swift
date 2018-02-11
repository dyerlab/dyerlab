//
//  MapPopulation.swift
//  Mapper
//
//  Created by Rodney Dyer on 2/10/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

class PopulationNode: NSObject, MKAnnotation {
    let title: String?
    let subtitle: String?
    let coordinate: CLLocationCoordinate2D
    
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D ) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
