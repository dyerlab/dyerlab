//
//  MappingFuncs.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/11/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

import MapKit


func barycenter( graph: Graph ) -> CLLocationCoordinate2D? {
    var lon: Double = 0.0
    var lat: Double = 0.0
    var ctr: Double = 0.0
    
    for node in graph.nodes {
        guard let coord = node.coordinate else { return nil }
        lon += coord.longitude
        lat += coord.latitude
        ctr += 1.0
    }

    if ctr > 0 {
        lat = lat / ctr
        lon = lon / ctr 
    }
    
    
    return CLLocationCoordinate2D(latitude: lat, longitude: lon )
    
}
