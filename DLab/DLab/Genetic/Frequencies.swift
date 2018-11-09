//
//  AlleleFrequencies.swift
//  DLab
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Base class for estimating allele frequences for a single locus.
 */
public class Frequencies: AnalysisBase  {
    
    /// Locus Name
    public var name: String
    
    /// Loci using to estimate parameters
    var loci: [Locus]
    
    /// Counts of each allele
    var counts = [String:Double]()
    
    /// Total number of individuals added
    public var N: Double = 0.0
    
    /// Observed count of heterozygotes
    var Ho: Double = 0.0
    
    /// Number of `Locus` objects able to be considered for Ho
    var HoN: Double = 0.0
    
    /// The alleles at this locus
    public var alleles: [String] {
        get {
            return counts.keys.sorted()
        }
    }
    
    
    /// HTML table of frequencies as `String`
    public var results: String {
        get {
            var ret = "<table><tr><td>Allele</td><td>Frequency</td></tr>"
            let keys = self.counts.keys.sorted {
                $0.compare($1, options: .numeric) == .orderedAscending
            }
            for key in keys {
                let freq = getFrequency( allele: key)
                ret += String("<tr><td>\(key)</td><td>\(freq)</td></tr>")
            }
            ret += "</table>"
            return ret
        }
    }
    
    
    /**
     Default init for analysis.
     
     - Parameters:
        - loci: An `Array<Locus>` to analyse
        - locusName: The Name of the locus being examined.
     
     */
    public init(loci: [Locus], locusName: String) {
        self.name = locusName
        self.loci = Array<Locus>()
        for locus in loci {
            addLocus(locus: locus)
        }
    }
    
    public func getFrequency( allele: String ) -> Double {
        if counts.keys.contains(allele) {
            return counts[allele]! / N
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
    
    public func addLocus( locus: Locus ) {
        self.loci.append( locus )

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


