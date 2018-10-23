//
//  Individual.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

public enum IndividualDataType {
    case All
    case Strata
    case Longitude
    case Latitude
    case External
    case Loci
    case Unknown
}


/**
 Base class for Individual objects.
 
 Individuals are repositories of data types including the following:
 - Strata (as `String` objects)
 - External (as `Double` data)
 - Coordinates (as )
 - Loci ( as `Locus` objects).
 
 Each
 */
public class Individual {
    
    public var strata: [String:String]
    public var loci: [String:Locus]
    public var coords: CLLocationCoordinate2D
    public var external: [String:Double]
    public var keys: [String] {
        get {
            var ret = [String]()
            
            var sortedArray = self.strata.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            ret.append(contentsOf: sortedArray )
            
            if( CLLocationCoordinate2DIsValid(self.coords) ) {
                ret.append("Longitude")
                ret.append("Latitude")
            }
            
            sortedArray = self.external.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            ret.append(contentsOf: sortedArray )
            
            sortedArray = self.loci.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            ret.append(contentsOf: sortedArray )
            return ret
        }
    }
    
    public init() {
        self.strata = [String:String]()
        self.loci = [String:Locus]()
        self.coords = CLLocationCoordinate2D(latitude: 180, longitude: 180)
        self.external = [String:Double]()
    }
    
    public func isEmpty() -> Bool {
        return self.keys.count == 0
    }
    
    public func hasCoord() -> Bool {
        return CLLocationCoordinate2DIsValid( self.coords )
    }
    
    public func keysForType( type: IndividualDataType) -> [String] {
        var ret: [String]
        switch type {
        case .Strata:
            ret = Array<String>( strata.keys )
        case .Longitude:
            ret = hasCoord() ? ["Longitude"] : []
        case .Latitude:
            ret = hasCoord() ? ["Latitude"] : []
        case .External:
            ret = Array<String>( external.keys )
        case .Loci:
            ret = Array<String>( loci.keys )
        default:
            ret = []
        }
        
        return ret;
    }
    
    public func type( key: String ) -> IndividualDataType {
        if loci.keys.contains(key) {
            return .Loci
        }
        else if key == "Longitude" {
            return .Longitude
        }
        else if key == "Latitude" {
            return .Latitude
        }
        else if strata.keys.contains(key) {
            return .Strata
        }
        else if external.keys.contains(key) {
            return .External
        }
        else {
            return .Unknown
        }
    }
    
    public func data( key: String ) -> String {
        if self.strata.keys.contains(key ) {
            return self.strata[key]!
        }
        else if key == "Longitude" {
            return String("\(self.coords.longitude)")
        }
        else if key == "Latitude" {
            return String("\(self.coords.latitude)")
        }
        else if self.loci.keys.contains(key) {
            return String("\(self.loci[key]!)")
        }
        else if self.external.keys.contains(key) {
            return String("\(self.external[key]!)")
        }
        else {
            return ""
        }
    }
    
}



// MARK: Equatable
extension Individual: Equatable {
    
    public static func == (left: Individual, right: Individual ) -> Bool {
        return left.coords == right.coords &&
            left.strata == right.strata &&
            left.loci == right.loci &&
            left.external == right.external
    }
    
    public static func !=(left: Individual, right: Individual) -> Bool {
        return !(left == right)
    }
}


// MARK: CustomStringConvertible

extension Individual: CustomStringConvertible {
    
    public var description: String {
        get {
            var ret = ""
            for key in self.keys {
                ret += String("\(self.data(key: key)) ")
            }
            return ret
        }
    }
    
}

