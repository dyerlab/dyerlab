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
//  MapView.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI
import MapKit


struct MapView: NSViewRepresentable {
    
    typealias NSViewType = MKMapView
    
    var region: MKCoordinateRegion
    let mapType: MKMapType
    
    public func makeCoordinator() -> MapCoordinator {
        let coordinator = MapCoordinator(self)
        return coordinator
    }
    
    public func makeNSView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        mapView.mapType = mapType
        mapView.delegate = context.coordinator
        DispatchQueue.main.async
        {
            mapView.setRegion(region, animated: true)
        }
        return mapView
    }
    
    public func updateNSView(_ nsView: MKMapView, context: Context) {
        nsView.mapType = mapType
    }
    
    
}


