//
//  Individual.swift
//  geno
//
//  Created by Rodney Dyer on 11/22/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit


enum IndividualDataType {
    case All
    case Strata
    case Longitude
    case Latitude
    case External
    case Loci
    case Unknown
}


class Individual {
    
    var strata: [String:String]
    var coordinate: CLLocationCoordinate2D?
    var external: [String:Double]
    var loci: [String:Locus]
    
    init() {
        strata = [String:String]()
        external = [String:Double]()
        loci = [String:Locus]()
        //coordinate = CLLocationCoordinate2D(latitude: 180, longitude: 180)
    }
    
    
}



// MARK: Getting & Setting Data

extension Individual {
    
    func setCoordinate( lat: Float, lon: Float ) {
        self.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon))
    }
    
    func allKeys() -> [String] {
        var ret = [String]()
        ret.append(contentsOf: self.strata.keys.sorted() )
        if coordinate != nil {
            ret.append(contentsOf: ["Latitude","Longitude"])
        }
        ret.append(contentsOf: self.external.keys.sorted() )
        ret.append(contentsOf: self.loci.keys.sorted())
        
        return ret
    }

    func valueForKey( key: String ) -> String {
        
        if loci.keys.contains( key ) {
            return "\(String(describing: loci[key]!))"
        }
        else if strata.keys.contains( key ) {
            return strata[key]!
        }
        else if key == "Longitude" {
            return "\(String(describing: coordinate!.longitude))"
        }
        else if key == "Latitude" {
            return "\(String(describing: coordinate!.latitude))"
        }
        else if external.keys.contains( key ) {
            return "\(external[key]!)"
        }


        return ""
    }
    
}
