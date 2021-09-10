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
//  MapCoordinator
//  MapCoordinator.swift
//
//  Created by Rodney Dyer on 8/31/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit


public class MapCoordinator: NSObject, MKMapViewDelegate {
    
    var parent: MapView
    
    init(_ parent: MapView ) {
        self.parent = parent
    }
    
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolygon {
            let polygonView = MKPolygonRenderer(overlay: overlay)
            polygonView.strokeColor = .init(red: 0/255, green: 66/255, blue: 255/255, alpha: 0.66)
            polygonView.fillColor = .init(red: 0/255, green: 66/255, blue: 255/255, alpha: 0.1)
            polygonView.alpha = 1.0
            polygonView.lineWidth = 2.0
            return polygonView
        }
        
        
        return MKOverlayRenderer()
    }
    
}
