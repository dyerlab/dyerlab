//
//  mapViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/11/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import MapKit

class MapviewViewController: NSViewController {

    var theGraph: Graph!

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
}





extension MapviewViewController {
    
    func setGraph( graph: Graph ) {
        theGraph = graph
    }
    
}
