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
//  Frequencies.swift
//  DLab
//
//  Created by Rodney Dyer on 8/13/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import Foundation


class Frequencies: Codable  {
    
    /// Average Ho
    var meanHo: Double {
        return frequencies.keys.count > 0 ?  frequencies.values.map { $0.Ho}.reduce(0.0, +) / Double( frequencies.keys.count ) : 0.0
    }

    /// Average He
    var meanHe: Double {
        return frequencies.keys.count > 0 ?  frequencies.values.map { $0.He}.reduce(0.0, +) / Double( frequencies.keys.count ) : 0.0
    }

    /// Average Fis
    var meanFis: Double {
        return frequencies.keys.count > 0 ?  frequencies.values.map { $0.Fis}.reduce(0.0, +) / Double( frequencies.keys.count ) : 0.0
    }

    
    /// The frequency objects for each locus
    var frequencies: [String:AlleleFrequencies]

    /// Coding keys for Codable
    enum CodingKeys: String, CodingKey {
        case frequencies = "frequencies"
    }


    /// Default initiator
    init() {
        self.frequencies = [String:AlleleFrequencies]()
    }
    
    
    /// Initiator with indiviudals
    /// - Parameter individuals: An ``Array`` of ``Individual`` objcts
    init( individuals: [Individual] ) {
        self.frequencies = [String:AlleleFrequencies]()
        for individual in individuals {
            addIndividual( individual )
        }
    }
    

    /// Default init from decoder
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.frequencies = try values.decode( Dictionary.self, forKey: .frequencies)
    }
    
    /// Default encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.frequencies, forKey: .frequencies)
    }
    
    
    
    
    /// Default addition of individual to the dictionary of allele frequency objects
    /// - Parameter ind: An ``Individual`` with one or more ``Locus`` objects
    public func addIndividual(_ ind: Individual ) {
        
        for locus in ind.locusNames {
            
            if !(frequencies.keys.contains( locus )) {
                frequencies[locus] = AlleleFrequencies()
            }
            
            frequencies[locus]!.addLocus(loc: ind.getLocus(name: locus ))
            
        }
    }
    
}
