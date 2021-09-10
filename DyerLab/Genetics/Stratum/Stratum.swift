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
//  Stratum.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

///  Base class for a group of individuals
class Stratum: Codable, Hashable, Identifiable, ObservableObject  {
    
    /// Make unique ID for each level
    public let id = UUID()
    
    /// The Label
    @Published public var label: String
    
    /// The Level
    @Published public var level: String
    
    
    /// The parent of this Stratum
    public var parent: Stratum?
    
    /// Children strata
    public var substrata: [Stratum]
    
    public var children: [Stratum]? {
        get {
            if substrata.isEmpty {
                return nil
            }
            else {
                return substrata
            }
        }
    }
    
    /// Grab current frequency object
    var frequencies: Frequencies {
        return Frequencies(individuals: allIndividuals  )
    }
    
    /// Is a Locale if it has no substrata
    public var isLocale: Bool {
        return substrata.isEmpty
    }
    
    /// The number of individuals in the stratum
    public var numIndividuals: Int {
        if substrata.count == 0 {
            return self.individuals.count
        }
        else {
            var n = [Int]()
            for child in substrata {
                n.append( child.numIndividuals )
            }
            return n.reduce( 0, + )
        }
    }
    
    /// Get the convex hull of all the points in the stratum
    public var hull: ConvexHull {
        return ConvexHull(pts: allCoordinates )
    }
    
    /// Get a vector of coordinates
    public var allCoordinates: [CLLocationCoordinate2D] {
        return self.allIndividuals.map { $0.coordinate }
    }
    
    /// Get a vector of all individuals
    public var allIndividuals: [Individual] {
        var ret = individuals
        for child in substrata {
            ret.append(contentsOf: child.allIndividuals )
        }
        return ret
    }
    
    public var allLevels: [String] {
        var ret = [ self.level ]
        for child in substrata {
            ret.append(contentsOf: child.allLevels )
        }
        return ret.uniqued()
    }
    
    
    public var numSubstrata: Int {
        return substrata.count
    }
    
    public var strataNames: [String] {
        
        var names = [String]()
        
        for child in substrata {
            names.append( child.label  )
        }
        return names
        
    }
    
    
    
    /// Subscript to access individuals
    public subscript(idx: Int) -> Individual? {
        if idx < allIndividuals.count {
            return self.allIndividuals[idx]
        }
        else {
            return nil
        }
    }
    
    /// Return stratum with specific name
    /// - Parameter named: The label on the stubstratum
    /// - Returns: The ``Stratum``
    public subscript(label: String) -> Stratum? {
        if self.label == label {
            return self
        }
        for child in substrata {
            if let found = child[label] {
                return found
            }
        }
        return nil
    }
    
    
    
    
    
    
    /*  PRIVATE ACCCESS STUFF  */
    private var individuals = [Individual]()
    
    
    /// Default Initalizer
    init(name: String, level: String = "All") {
        self.substrata = [Stratum]()
        self.label = name
        self.level = level
    }
    
    
    
    /// To make it hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine( self.id  )
    }
    
    
    
    
    
    
    
    
    /// Required initializer for Coding Protocol
    /// - Parameter decoder: A ``Decoder`` object
    public required init( from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.label = try values.decode(String.self, forKey: .label)
        self.level = try values.decode(String.self, forKey: .level)
        self.substrata = try values.decode( Array.self, forKey: .substrata )
        self.parent = try values.decode( Stratum.self, forKey: .parent )
        self.individuals = try values.decode( Array.self, forKey: .individuals )
    }
    
    
    /// Required encoder for Coding protocol
    /// - Parameter encoder: An ``Encoder`` object.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.label, forKey: .label)
        try container.encode( self.level, forKey: .level)
        try container.encode( self.substrata, forKey: .substrata )
        try container.encode( self.parent, forKey: .parent )
        try container.encode( self.individuals, forKey: .individuals )
        
    }
    
    
    
    /// Keys for Coding
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case level = "level"
        case substrata = "substrata"
        case parent = "parent"
        case individuals = "individuals"
    }
    
    enum StrataError: Error {
        case SubstrataNotPresent
    }
    
    
}


/// MARK: - Individual and stratum addition.
/**
 Making of indivduals and such
 */
extension Stratum {
    
    public func addIndividual( _ individual: Individual, toStrata: String ) throws  {
        
        if toStrata == self.label {
            self.individuals.append( individual )
        }
        
        else {
            let stratum = self[toStrata]
            if stratum != nil {
                stratum?.individuals.append( individual )
            }
            else {
                throw StrataError.SubstrataNotPresent
            }
        }
    }
    
    public func addSubstrata( labels: [String], levels: [String] ) {
        var cur = self
        
        for i in 0 ..< labels.count {
            let label = labels[i]
            let level = levels[i]

            let child = self[label] ?? Stratum(name: label, level: level ) 
            
            // Only nil if it hasn't been added already
            if child.parent == nil {
                child.parent = cur
                cur.substrata.append( child )
            }
            
            cur = child
        }
    }
    
}





extension Stratum: Equatable {
    
    /// Overload of the stub for equatability of two stratum
    public static func ==(lhs: Stratum, rhs: Stratum) -> Bool {
        return lhs.label == rhs.label && lhs.substrata == rhs.substrata
    }
    
}


extension Stratum: CustomStringConvertible {
    
    public var description: String {
        var text = " \(label) "
        if isLocale {
            text += "\n"
            for ind in self.individuals {
                text += "  \(ind)\n"
            }
        }
        
        if !substrata.isEmpty {
            text += "{" + substrata.map { $0.description }.joined(separator: ", ") + "}"
        }
        
        return text
    }
    
}



extension Stratum {
    
    var region: MKCoordinateRegion {
        return MKCoordinateRegion(coordinates: allIndividuals.map { $0.coordinate } )
    }
    
    var centroid: CLLocationCoordinate2D {
        return allIndividuals.map { $0.coordinate }.center()
    }
    
    var mapRect: MKMapRect {
        let region = self.region
        
        let topLeft = CLLocationCoordinate2D(latitude: region.center.latitude + (region.span.latitudeDelta/2), longitude: region.center.longitude - (region.span.longitudeDelta/2))
        let bottomRight = CLLocationCoordinate2D(latitude: region.center.latitude - (region.span.latitudeDelta/2), longitude: region.center.longitude + (region.span.longitudeDelta/2))
        
        let a = MKMapPoint( topLeft )
        let b = MKMapPoint( bottomRight )
        
        return MKMapRect(origin: MKMapPoint(x: min(a.x,b.x), y: min(a.y,b.y)), size: MKMapSize(width: abs(a.x-b.x), height: abs(a.y-b.y)))
    }
    
}





extension Stratum {
    
    static func defaultStratum() -> Stratum {
        let ret = Stratum(name: "Default Population")
        for _ in 1...10 {
            do {
                try ret.addIndividual( Individual.defaultIndividual(), toStrata: "Default Population")
            }
            catch {
                print("Error adding individuals to default Stratum")
            }
        }
        return ret
    }
    
    
}


