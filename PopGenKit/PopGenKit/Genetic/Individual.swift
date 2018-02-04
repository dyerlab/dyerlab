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
    case Coordinates
    case External
    case Loci
    case Unknown
}

public class Individual {
    
    public var strata: [String:String]
    public var loci: [String:Locus]
    public var coords: [String:Double]
    public var external: [String:Double]
    public var keys: [String] {
        get {
            var ret = [String]()
            
            var sortedArray = self.strata.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            ret.append(contentsOf: sortedArray )
            
            sortedArray = self.coords.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            ret.append(contentsOf: sortedArray )
            
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
        self.coords = [String:Double]()
        self.external = [String:Double]()
    }
    
    public func type( key: String ) -> IndividualDataType {
        if loci.keys.contains(key) {
            return .Loci
        }
        else if coords.keys.contains(key) {
            return .Coordinates
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
    
    public func data(_ key: String ) -> String {
        if self.strata.keys.contains(key ) {
            return self.strata[key]!
        }
        else if self.coords.keys.contains(key) {
            return String("\(self.coords[key]!)")
        }
        else if self.loci.keys.contains(key) {
            return String("\(self.loci[key]!)")
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
}


// MARK: CustomStringConvertible

extension Individual: CustomStringConvertible {
    public var description: String {
        get {
            var ret = ""
            for key in self.keys {
                ret += String("\(self.data(key))")
            }
            return ret
        }
    }
}

