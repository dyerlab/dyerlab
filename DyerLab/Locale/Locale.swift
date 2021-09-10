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
//  Locale
//  Locale.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

class Locale: Identifiable, Hashable {
    
    var id = UUID()
    
    var name: String
    
    var level: String
    
    var individuals: [Individual]
        
    var frequencies: Frequencies
    
    var count: Int {
        return individuals.count
    }
    
    var places: [Place] {
        var ret = [Place]()
        for individual in individuals {
            ret.append( Place(label: individual.id.uuidString, coordinate: individual.coordinate))
        }
        return ret
    }
    
    var coordinates: [CLLocationCoordinate2D] {
        return individuals.map { $0.coordinate }
    }
    
    var region: MKCoordinateRegion {
        return MKCoordinateRegion(coordinates:  self.coordinates )
    }
    
    var centroid: CLLocationCoordinate2D {
        return self.coordinates.center()
    }
    
    var mapRect: MKMapRect {
        let region = self.region
        
        let topLeft = CLLocationCoordinate2D(latitude: region.center.latitude + (region.span.latitudeDelta/2), longitude: region.center.longitude - (region.span.longitudeDelta/2))
        let bottomRight = CLLocationCoordinate2D(latitude: region.center.latitude - (region.span.latitudeDelta/2), longitude: region.center.longitude + (region.span.longitudeDelta/2))
        
        let a = MKMapPoint( topLeft )
        let b = MKMapPoint( bottomRight )
        
        return MKMapRect(origin: MKMapPoint(x: min(a.x,b.x), y: min(a.y,b.y)), size: MKMapSize(width: abs(a.x-b.x), height: abs(a.y-b.y)))
    }

    subscript(idx: Int) -> Individual? {
        return idx < self.count ? individuals[idx] : nil
    }
    
    init(name: String, level: String ) {
        self.name = name
        self.level = level
        self.individuals = [Individual]()
        self.frequencies = Frequencies()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine( self.id )
        hasher.combine( self.name )
        hasher.combine( self.level )
    }
    
    
    func addIndividual(individual: Individual) {
        self.frequencies.addIndividual( individual )
        self.individuals.append( individual )
    }
    
    static func == (lhs: Locale, rhs: Locale) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    
    
    
}





extension Locale {
    
    static func defaultLocale() -> Locale {
        return DataSet.defaultDataSet().locales["All", default: Locale(name: "All", level: "All")]
    }
}


    
