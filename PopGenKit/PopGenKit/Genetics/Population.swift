//
//  Population.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit


/**
 Base class for a collection of indivduals.
 
 This is the main data container for individuals.  This can represent
 the entire data set or subsets thereof.
 */
public class Population {
    
    /// Array of `Individual` objects
    public var individuals: [Individual]
    
    /// Number of `Individual` objects in the `Population`
    public var count: Int {
        get {
            return individuals.count
        }
    }
    
    /// Data Keys content of `Individual` types.
    public var keys: [String] {
        get {
            var ret = [String]()
            
            if self.individuals.count > 0 {
                var sortedArray = self.individuals[0].strata.keys.sorted {
                    $0.compare($1, options: .numeric) == .orderedAscending
                }
                ret.append(contentsOf: sortedArray )
                
                if self.individuals[0].hasCoord() {
                    ret.append("Latitude")
                    ret.append("Longitude")
                }
                
                sortedArray = self.individuals[0].external.keys.sorted {
                    $0.compare($1, options: .numeric) == .orderedAscending
                }
                ret.append(contentsOf: sortedArray )
                
                sortedArray = self.individuals[0].loci.keys.sorted {
                    $0.compare($1, options: .numeric) == .orderedAscending
                }
                ret.append(contentsOf: sortedArray )
            }
            return ret
        }
    }
    
    /**
     Default init for the Population object.
    */
    public init() {
        self.individuals = Array<Individual>()
    }
    

    
}


// MARK: Extractions

extension Population {
    
    /**
     Get the keys from the `Indiviudal` for specific data types.
     
     - Parameters:
        - type: The category of `IndividualDataType` being requested.
     
     - Returns: A `[String]` object of keyes for `type`
     */
    public func keysForType(type: IndividualDataType ) -> [String] {
        assert( self.count > 0 )
        switch type {
        case .Loci:
            return Array(individuals[0].loci.keys)
        case .Strata:
            return Array(individuals[0].strata.keys)
        case .Longitude:
            return ["Longitude"]
        case .Latitude:
            return ["Latitude"]
        case .External:
            return Array(individuals[0].external.keys)
        default:
            return [String]()
        }
    }
    
    /**
     Returns an `Array<String>` for a given key.
     
     - Parameters:
        - key: The `String` of the column key.
     
     - Returns: A `[Any]` for `key`
     */
    public func getValues(key: String) -> [Any] {
        assert( self.count > 0)
        var ret = [Any]()
        
        let type = individuals[0].type(key: key)
        for individual in self.individuals {
            switch type {
            case .Loci:
                ret.append(individual.loci[key]!)
            case .Strata:
                ret.append(individual.strata[key]!)
            case .External:
                ret.append(individual.external[key]!)
            case .Longitude:
                ret.append(individual.coords.longitude)
            case .Latitude:
                ret.append( individual.coords.latitude )
            default:
                ret.append("")
            }
        }
        return ret
    }
    
    /**
     Retrieve individual data types from an individual.
     
     - Parameters:
     - key: The name of the data key being requested.
     - row: The index of the individual to request the data from
     
     - Returns: A `String` representation of the data at `key:row`
     */
    public func data( key: String, row: Int ) -> String {
        assert(individuals.count > row )
        return individuals[row].data(key: key)
    }
    
    
}

// MARK: Extension for printing

extension Population: CustomStringConvertible {
    
    /// General Summary description
    public var summary: String {
        get {
            var ret = "\nPopulation:\n"
            ret += String(" - \(self.count) Individuals\n")
            if self.individuals.count > 0 {
                var keys = individuals[0].keysForType(type: .Strata)
                ret += String(" - \(keys.count) Strata values\n")
                
                if CLLocationCoordinate2DIsValid( individuals[0].coords ) {
                    keys = individuals[0].keysForType(type: .Latitude)
                    ret += String(" - 2 Coordinate values\n")
                } else {
                    ret += String(" - 0 Coordinate values\n")
                }
                
                keys = individuals[0].keysForType(type: .External)
                ret += String(" - \(keys.count) External variables\n")
                keys = individuals[0].keysForType(type: .Loci)
                ret += String(" - \(keys.count) Locus variables\n")
            }
            return ret
        }
    }
    
    /// String description for printing the raw data
    public var description: String {
        get {
            var ret = ""
            for individual in self.individuals {
                ret += String("\(individual)\n")
            }
            return ret
        }
    }
}

