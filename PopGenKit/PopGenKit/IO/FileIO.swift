//
//  FileIO.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public func makeRandomPopulation() -> Population {
    let pop = Population()
    
    for i in 1...100 {
        let ind = Individual()
        ind.strata["Population"] = String("Pop-\(1+(i % 10))")
        for j in 1...20 {
            let alleles = ["A","B","C"]
            let geno:[String] = [ alleles.randomElement()!, alleles.randomElement()! ]
            ind.loci[ String("Loc-\(j)")] = Locus( geno )
        }
        pop.individuals.append( ind )
    }
    return pop
}


public func loadPopulation( path: String, strata: Int, coords: Int, external: Int, loci: Int ) -> Population {
    let pop = Population()
    return pop
}
