//
//  AlleleFrequencies.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

class Frequencies: AnalysisBase {
    var name: String
    var loci: [Locus]
    var counts = [String:Double]()
    var N: Double = 0.0
    var Ho: Double = 0.0
    var HoN: Double = 0.0
    var results: String {
        get {
            var ret = "<table><tr><td>Allele</td><td>Frequency</td></tr>"
            let keys = self.counts.keys.sorted()
            for key in keys {
                let freq = getFrequency(key)
                ret += String("<tr><td>\(key)</td><td>\(freq)</td></tr>")
            }
            ret += "</table>"
            return ret
        }
    }
    
    init(loci: [Locus], locusName: String) {
        self.name = String("Allele Frequencies: \(locusName)")
        self.loci = loci
    }
    
    func run() {
        for locus in loci {
            if locus.ploidy > 0 {
                HoN += 1.0
            }
            for allele in locus.alleles {
                if !(counts.keys.contains(allele)) {
                    counts[allele] = 1.0
                }
                else {
                    counts[allele]! += 1.0
                }
                N += 1.0
            }
        }
    }
    
    func getFrequency(_ key: String ) -> Double {
        if counts.keys.contains(key) {
            return counts[key]! / N
        }
        else {
            return 0.0
        }
    }
    
}



