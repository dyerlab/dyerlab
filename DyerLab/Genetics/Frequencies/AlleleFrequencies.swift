//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  AlleleFrequencies.swift
//  DLab
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import Foundation



/// Base class for estimating allele frequencies at a single locus.
public class AlleleFrequencies: Codable {
    
    /// alleles recorded
    var counts = [String: Double]()
    /// total number of alleles entered
    var totalN: Double = 0.0
    /// number of heterozygotes
    var heterozygotes: Double = 0.0
    /// number of diploid loci added
    var diploidN: Double = 0.0
    
    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        case counts = "counts"
        case total = "total"
        case heterozygotes = "heterozygotes"
        case diploid = "diploid"
    }
    
    
    /// Observed Heterzygosity
    public var Ho: Double {
        if diploidN > 0.0 {
            return heterozygotes / diploidN
        } else {
            return 0.0
        }
    }
    
    /// Expected heterozygosity
    public var He: Double {
        return 1.0 - frequencies(alleles: alleles).map { $0 * $0 }.sum
    }
    
    /// Inbreeding parameter
    public var Fis: Double {
        if He != 0 {
            return 1.0 - Ho/He
        } else {
            return 0.0
        }
    }
    
    /// Get alleles at the locus already
    public var alleles: [String] {
        return counts.keys.sorted()
    }
    
    /// Default initializer
    public init() {}
    
    
    /// Required initializer for Coding Protocol
    /// - Parameter decoder: A ``Decoder`` object
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.counts = try values.decode(Dictionary.self, forKey: .counts )
        self.totalN = try values.decode(Double.self, forKey: .total )
        self.heterozygotes = try values.decode( Double.self, forKey: .heterozygotes )
        self.diploidN = try values.decode( Double.self, forKey: .diploid )
    }
    
    
    /// Required encoder for Coding protocol
    /// - Parameter encoder: An ``Encoder`` object.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.counts, forKey: .counts )
        try container.encode( self.heterozygotes, forKey: .heterozygotes)
        try container.encode( self.totalN, forKey: .total)
        try container.encode( self.diploidN, forKey: .diploid )
    }
    
    
    
    
    
    
    
    /// The default function to add a locus to the frequency object
    /// - Parameter loc: The locus to add
    public func addLocus( loc: Locus ) {
        
        if loc.isMissing {
            return
        }
        
        // Grab heterozygote
        if loc.ploidy == .Diploid {
            diploidN += 1.0
            if loc.isHeterozygote {
                heterozygotes += 1.0
            }
        }
        
        // Add Alleles
        for allele in loc.alleles {
            
            self.counts[ allele ] = self.counts[allele, default: 0.0] + 1.0
            
            totalN += 1.0
        }
    }
    
    
    
    
    
    
    /// The main access to allele frequencies for a specific allele
    /// - Parameter name: The name of the locus
    /// - Returns: The frequency of the allele (or zero)
    public func frequency( name: String ) -> Double {
        if totalN == 0 {
            return 0.0
        }
        
        return self.counts[name, default: 0.0] / totalN
    }
    
    /// Returns vector of allele frequencies
    ///  - Parameters:
    ///     - alleles: The names of the alleles requested
    ///  - Returns: A vector of allele frequencies
    public func frequencies( alleles: [String] ) -> Vector {
        var ret = Vector(repeating: 0.0, count: alleles.count)
        for i in 0 ..< alleles.count {
            ret[i] = frequency(name: alleles[i])
        }
        return ret
    }
    
    
    
    
    
    static func exampleFrequencies() -> AlleleFrequencies {
        let ret = AlleleFrequencies()
        ret.addLocus(loc: Locus(left: "A", right: "A") )
        ret.addLocus(loc: Locus(left: "A", right: "A") )
        ret.addLocus(loc: Locus(left: "A", right: "A") )
        ret.addLocus(loc: Locus(left: "A", right: "B") )
        ret.addLocus(loc: Locus(left: "A", right: "B") )
        ret.addLocus(loc: Locus(left: "A", right: "B") )
        ret.addLocus(loc: Locus(left: "A", right: "B") )
        ret.addLocus(loc: Locus(left: "B", right: "B") )
        ret.addLocus(loc: Locus(left: "B", right: "B") )
        ret.addLocus(loc: Locus(left: "B", right: "B") )
        return ret
    }
    
}





extension AlleleFrequencies: CustomStringConvertible {
    
    public var description: String {
        var ret: String = ""
        for allele in self.alleles {
            ret += String(" \(allele): \(frequency(name: allele)) (\(counts[allele] ?? 0.0 )) \n")
        }
        return ret
    }
    
}






public func +(lhs: AlleleFrequencies, rhs: AlleleFrequencies ) -> AlleleFrequencies {
    
    let ret = AlleleFrequencies()
    
    ret.counts.merge( dict: lhs.counts )
    ret.counts.merge( dict: rhs.counts )
    ret.totalN = lhs.totalN + rhs.totalN
    ret.heterozygotes = lhs.heterozygotes + rhs.heterozygotes
    ret.diploidN = lhs.diploidN + rhs.diploidN
    
    return ret
}
