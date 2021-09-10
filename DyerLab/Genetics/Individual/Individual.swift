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
//  Individual.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit
import SwiftUI


/// Default class for an individual
public class Individual: Codable, Identifiable, ObservableObject, CustomStringConvertible, Equatable {
    
    
    /// A unique ID for each individual
    public var id = UUID()
    
    /// The loci
    public var loci: [String:Locus]
    
    
    // Proiviate hack to have CLLocationCoordinte Work
    private var _latitude: CLLocationDegrees
    private var _longitude: CLLocationDegrees
    
    /// spatial coordinate
    public var coordinate: CLLocationCoordinate2D {
        get {
            return CLLocationCoordinate2D(latitude: _latitude, longitude: _longitude)
        }
        set {
            self._latitude = newValue.latitude
            self._longitude = newValue.longitude
        }
    }
    
    
    public var place: Place {
        return Place(id: self.id, label: String("ID: \(self.id.description)" ), coordinate: self.coordinate ) 
    }

    
    /// CodiungKeys for Codabiltiy
    enum CodingKeys: String, CodingKey {
        case id
        case loci
        case latitude
        case longitude
    }
    
    
    /// The names of the loci
    public var locusNames: [String] {
        return loci.keys.sorted()
    }
    
    
    /// Number of loci
    public var numLoci: Int {
        return self.loci.keys.count 
    }
    
    /// String description
    public var description: String {
        var ret = String("\(self.id.description)")
        
        ret += String(" \(_latitude)")
        ret += String(" \(_longitude)")
        
        for locus in self.locusNames {
            let loc = getLocus(name: locus)
            ret += " \( loc ) "
        }
        return ret
    }
    
    
    /// Default init
    public init() {
        loci = [String:Locus]()
        _longitude = 0.0
        _latitude = 0.0
    }
    
    
    /// Init with latitude and longitude
    public init( latitude: CLLocationDegrees, longitude: CLLocationDegrees ) {
        self.loci = [String:Locus]()
        self._latitude = latitude
        self._longitude = longitude
    }
    
    /// Overloaded init for Decodable
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.id = try values.decode( UUID.self, forKey: .id )
        self.loci = try values.decode( [String : Locus].self , forKey: .loci )
        self._latitude = try values.decode( CLLocationDegrees.self, forKey: .latitude )
        self._longitude = try values.decode( CLLocationDegrees.self, forKey: .longitude )
    }
    
    /// Overload for Encodable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( id, forKey: .id )
        try container.encode( loci, forKey: .loci )
        try container.encode( _latitude, forKey: .latitude )
        try container.encode( _longitude, forKey: .longitude )
    }
    
    
    /// Overload for Equatable
    public static func == (lhs: Individual, rhs: Individual) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    /// This is a static function that return a static individual
    static func exampleIndividual() -> Individual {
        let ind = Individual(latitude: 37.0, longitude: -77.0)
        ind.addLocus(name: "TPI", allele1: "A", allele2: "a")
        ind.addLocus(name: "MP1", allele1: "b", allele2: "b")
        ind.addLocus(name: "AAT", allele1: "c", allele2: "C")
        return ind
    }


    /// Default method for adding a new locus to an individual
    /// - Parameters:
    ///  - name: The name of the locus
    ///  - allele1: The left allele
    ///  - allele2: The right allele
    public func addLocus( name: String, allele1: String, allele2: String ) {
        self.loci[name] = Locus(left: allele1, right: allele2)
    }
    
    /// Default getter function for loci
    /// - Parameters:
    ///  - name: The name of the locus
    /// - Returns: The stored locus (if it exists) OR an empty locus object.
    public func getLocus( name: String ) -> Locus {
        return self.loci[name] ?? Locus()
    }
    
    
}



extension Individual {
    
    static public func defaultIndividual() -> Individual {
        
        let ind = Individual( latitude: 37.0 + Double.random(in: -10.0...10.0),
                              longitude: -77.0 + Double.random(in: -10.0...10.0))
        let loci: [String] = ["AAT","CPI", "IDH","FE"]
        for locus in loci {
            ind.addLocus(name: locus,
                         allele1: String("\([1,2,3,4].randomElement()!)"),
                         allele2: String("\([1,2,3,4].randomElement()!)") )
        }
        return ind
    }
    
}





extension Individual {
    
    /// The thing should be able to give out a region
    var region: MKCoordinateRegion {
        get {
            return MKCoordinateRegion( center: self.coordinate,
                                       span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5) )
        }
    }
    
    /// The object should provide one or more items
    var markers: [Place] {
        get {
            return [ self.place ]
        }
    }
    
}


extension Individual: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine( id )
    }
    
}
