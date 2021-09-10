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
//  DLab
//  GenotypeFileFormat.swift
//
//  Created by Rodney Dyer on 7/19/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/**
 Struct to hold fileinput data for genotypes from text.
 
 All input text should be in the following format.
 - Text file saved as CSV
 - Strata columns then coordinates then loci
 - Header row with column names (case sensitive)
 - The name `Population` will be considered primary sampling strata.
 - The names `Longitude` and `Latitude` will be required and put the coordinates in damn decimal degrees already!
 - Loci are single column with alleles separated by a colon `:`
 */
public struct GenotypeFileFormat {
    
    /// Number of columns for individual strata
    public var numStrata: Int
    
    /// Each individual has coordiante flag
    public var hasCoordinates: Bool
    
    /// Number of loci to use
    public var numLoci: Int
    
    /// Designated initializer
    ///
    /// - Parameter strata: An `Int` indicating the number of strata in the data file
    /// - Parameter loci: An `Int` indicating the  number of loci.  These are always the last columns.  Loci with
    ///     diploid or higher ploidy levels must have alleles separated by a colon (e.g., 124:128 or A:C).
    /// - parameter coords: A flag indicating the presence of coordiantes in the data set.  These **must** be
    ///     labeled as *Latitude* and *Longitude* and be recorded as decimal degrees.
    public init( strata: Int, loci: Int, coords: Bool = false ) {
        self.numStrata = strata
        self.numLoci = loci
        self.hasCoordinates = coords
    }
}

