//
//  Population.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Population {
    
    public var individuals: [Individual]
    public var count: Int {
        get {
            return individuals.count
        }
    }
    public var keys: [String] {
        get {
            var ret = [String]()
            
            if self.individuals.count > 0 {
                var sortedArray = self.individuals[0].strata.keys.sorted {
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
    
    
    init() {
        self.individuals = Array<Individual>()
    }
    
    
    func data( key: String, row: Int ) -> String {
        assert(individuals.count > row )
        return individuals[row].data(key)
    }
    
}


// MARK: Extractions

extension Population {
    
    public func keysForType(type: IndividualDataType ) -> [String] {
        assert( self.count > 0 )
        switch type {
        case .Loci:
            return Array(individuals[0].loci.keys)
        case .Strata:
            return Array(individuals[0].strata.keys)
        case .Coordinates:
            return Array(individuals[0].coords.keys)
        case .External:
            return Array(individuals[0].external.keys)
        default:
            return [String]()
        }
    }
    
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
            default:
                ret.append(individual.coords[key]!)
            }
        }
        return ret
    }
    
    
}



