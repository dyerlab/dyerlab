//
//  AlleleFrequencies.swift
//  geno
//
//  Created by Rodney Dyer on 11/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

class AlleleFrequencies {
    var Nalleles: Double = 0.0
    var NHo: Double = 0.0
    var Ndip: Double = 0.0
    var Ho: Double {
        get {
            return Ndip > 0 ? NHo / Ndip : 0.0
        }
    }
    var He: Double {
        get {
            return 1.0 - (frequencies().reduce(0) { $0 + ($1*$1) })
        }
    }
    var counts: [String:Double] = Dictionary<String,Double>()
    
    func addLocus( loc: Locus ) {
        if loc.isEmpty() {
            return
        }
        if loc.ploidy() > 1 {
            Ndip = Ndip + 1.0
            if loc.isHeterozygote() {
                NHo = NHo + 1.0
            }
        }
        for allele in loc.alleles {
            if counts.keys.contains(allele) {
                counts[allele] = counts[allele]! + 1.0
            }
            else {
                counts[allele] = 1.0
            }
            Nalleles = Nalleles + 1.0
        }
    }
    
    
    func frequency( allele: String ) -> Double {
        let ct = self.counts[allele]!
        return ct == 0.0 ? ct : ct/Nalleles
    }
    
    func frequencies() -> [Double] {
        let p = Array<Double>( counts.values )
        return p.map { $0 / Nalleles }
    }
}
