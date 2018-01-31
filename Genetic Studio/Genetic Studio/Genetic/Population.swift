//
//  Population.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Population {
    
    var individuals: [Individual]
    
    init() {
        self.individuals = Array<Individual>()
    }
    
    
}


func makeRandomPopulation() -> Population {
    let pop = Population()
    
    for i in 1...100 {
        let ind = Individual()
        ind.strata["Population"] = String("Pop-\(1+(i % 10))")
        for j in 1...20 {
            let alleles = ["A","B","C"]
            let geno = [ alleles.randomElement(), alleles.randomElement() ]
            ind.loci[ String("Loc-\(j)")] = Locus(alleles: geno as! [String])
        }
        pop.individuals.append( ind )
    }
    return pop
}
