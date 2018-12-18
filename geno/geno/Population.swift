//
//  Population.swift
//  geno
//
//  Created by Rodney Dyer on 11/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


class Population {
    var individuals: [Individual]
    var frequencies: [String: AlleleFrequencies]
    
    
    init() {
        individuals = Array<Individual>()
        frequencies = [String:AlleleFrequencies]()
    }
    
    
    func addIndividual(_ theInd: Individual ) {
        for loc in theInd.loci.keys {
            if !frequencies.keys.contains(loc) {
                frequencies[loc] = AlleleFrequencies()
            }
            frequencies[loc]?.addLocus(loc: theInd.loci[loc]!)
        }
        self.individuals.append(theInd)
    }
}




// MARK: Table related extensions

extension Population {
    
    func allKeys() -> [String] {
        if individuals.count > 0 {
            return individuals[0].allKeys()
        } else {
            return [String]()
        }
    }
        
    
}
