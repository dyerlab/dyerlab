//
//  AlleleFrequencies.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Frequencies: AnalysisBase  {
    public var name: String
    var loci: [Locus]
    var counts = [String:Double]()
    var N: Double = 0.0
    var Ho: Double = 0.0
    var HoN: Double = 0.0
    public var results: String {
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
    
    public init(loci: [Locus], locusName: String) {
        self.name = String("Allele Frequencies: \(locusName)")
        self.loci = loci
    }
    
    public func getFrequency(_ key: String ) -> Double {
        if counts.keys.contains(key) {
            return counts[key]! / N
        }
        else {
            return 0.0
        }
    }
    
    public func getHo() -> Double {
        return HoN > 0.0 ? Ho/HoN : 0.0
    }
    
    public func getHe() -> Double {
        var vals = Array<Double>(counts.values)
        if N > 0 {
            vals = vals.map {$0 / N}
            return 1.0 - vals.map{$0*$0}.reduce(0,+)
        }
        else {
            return 0.0
        }
        
    }
    
    public func run() {
        for locus in loci {
            if locus.ploidy > 0 {
                HoN += 1.0
                if locus.isHeterozygote() {
                    Ho += 1.0
                }
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
    
    
}


