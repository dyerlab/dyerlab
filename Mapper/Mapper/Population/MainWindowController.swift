//
//  MainWindowController.swift
//  Mapper
//
//  Created by Rodney Dyer on 2/10/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import MapKit


class MainWindowController : NSWindowController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 5000
    let initialLocation = CLLocationCoordinate2DMake(37.53, -77.47)
    
    
    override var windowNibName: NSNib.Name? {
        get {
            return NSNib.Name(rawValue: "MainWindowController" )
        }
    }
    
    func centerMapOnLocation( location: CLLocationCoordinate2D ) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
    func centerMap() {
        var zoomRect = MKMapRectNull
        for annotation in mapView.annotations {
            let annotationPoint = MKMapPointForCoordinate(annotation.coordinate)
            let pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0, 0)
            if (MKMapRectIsNull(zoomRect)) {
                zoomRect = pointRect
            } else {
                zoomRect = MKMapRectUnion(zoomRect, pointRect)
            }
        }
        mapView.setVisibleMapRect(zoomRect, animated: true)
    }
    
    override func windowDidLoad() {
        print("MainWindowController::windowDidLoad()")
        
        mapView.addAnnotation( PopulationNode(title: "CES",
                                     subtitle: "Center for Environmental Studies",
                                     coordinate: CLLocationCoordinate2DMake(37.545010, -77.454849)))
        
        mapView.addAnnotation( PopulationNode(title: "Monroe Park",
                                     subtitle: "The Monroe Park Open Area",
                                     coordinate: CLLocationCoordinate2DMake(37.547043, -77.450012)))
        
        mapView.addAnnotation( PopulationNode(title: "Kúba Kúba",
                                     subtitle: "An Awesome Place to Eat",
                                     coordinate: CLLocationCoordinate2DMake(37.551187, -77.458865)))
        
        
        
        
        centerMap()
        
        
        
        
    }
    
    
    
    
}
