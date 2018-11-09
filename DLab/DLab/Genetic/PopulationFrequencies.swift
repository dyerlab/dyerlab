//
//  PopulationFrequencies.swift
//  DLab
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

	

/**
 Basic structure for allele frequencies across loci.
 */
public struct PopulationFrequencies {
    
    /// Locus name being used
    public var locusName: String
    /// The Name of the Straum being added
    public var strataName: String
    /// Dictionary of `Frequencies` Objects
    public var frequencies: [String: Frequencies]
    /// The strata currently being used.
    public var strata : [String] {
        get {
            return frequencies.keys.sorted()
        }
    }
    
    /**
     Default initializer for the analysis
     
     - Parameters:
        - thePop: A `Population` object from which to grab individuals and loci.
        - stratum: The column of data to use as a stratum.
        - locus: The locus to use.
     
     - Returns: A fully constructed `PopulationFrequencies` object.
     */
    init(thePop: Population, stratum: String, locus: String ) {
        self.frequencies = [String:Frequencies]()
        self.locusName = locus
        self.strataName = stratum
        for i in 0..<thePop.count {
            addIndividual(theInd: thePop.individuals[i] )
        }
    }
    
    /**
     Default function for adding indiviudals to this analysis.
     
     By construction, the initializer must be called first as it specifies both the stratum
     to use as well as the locus of interest.
     
     - Parameters:
        - theInd: An `Individual` from which strata and locus data are extracted.
     */
    public mutating func addIndividual( theInd: Individual){
        if let theStratum = theInd.strata[strataName] {
            if let theLocus = theInd.loci[locusName] {
                if !self.frequencies.keys.contains(theStratum) {
                    self.frequencies[ theStratum ] = Frequencies(loci: [], locusName:locusName)
                }
                self.frequencies[ theStratum ]?.addLocus(locus: theLocus )
            }
        }
    }
    
    /**
     Converts data to `Matrix` format.
     
     - Returns: A `Matrix` object with each stratum as a row and each allele
     as a column.
     */
    public func asMatrix() -> Matrix {
        var alleles = [String]()
        for stratum in strata {
            alleles.append(contentsOf: frequencies[stratum]!.alleles)
        }
        alleles = Array(Set(alleles)).sorted()
        let nrow = strata.count
        let ncol = alleles.count
        
        var matrix = Matrix(rows: nrow, cols: ncol)
        for i in 0..<strata.count {
            for j in 0..<alleles.count {
                if let f = frequencies[strata[i]]?.getFrequency(allele: alleles[j]) {
                    matrix[i,j] = f
                }
            }
        }
        
        matrix.rowNames = strata
        matrix.colNames = alleles
        
        return matrix
    }
    
    
}
