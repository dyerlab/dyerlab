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
//  ImportGenotypeFile.swift
//
//  Created by Rodney Dyer on 7/19/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import MapKit

/**
 Main entry point to input genotype file from csv.
 
 - Parameter path: The path to the file
 - Parameter format: An instance of the InputFileFormat that describes the contents of the file being imported.
 
 - Returns:
    - An array (potentially empty) of Individual objects
 */
func importGenotypeFile(path: String, format: GenotypeFileFormat ) -> DataSet {
    let data = DataSet(levels: ["All"])
    
    if path.isEmpty {
        return data
    }
    
    guard let contents = parseDelimitedFile(path: path, delimiter: ",") else { return data }
    if contents.isEmpty {
        return data
    }
    
    let header = contents[0]
    var levels = [String]()
    for i in 0 ..< format.numStrata {
        levels.append( header[i] )
    }
    data.levels.append(contentsOf: levels )
    
    
    for i in 1 ..< contents.count  {
        let row = contents[i]
        
        if row.count == header.count {
            
            let ind = Individual()
            var stratum = [String]()
            
            // Add the strata
            for j in 0 ..< format.numStrata {
                stratum.append( row[j] )
            }
            
            
            // Add the coordinates
            var numCoords = 0
            if format.hasCoordinates {
                if let latIdx = header.firstIndex(of: "Latitude") {
                    numCoords += 1
                    let lat = Double( row[latIdx] )
                    if let lonIdx = header.firstIndex(of: "Longitude" ) {
                        numCoords += 1
                        let lon = Double( row[lonIdx] )
                        ind.coordinate = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)
                    }
                }
            }
            let locusStart = format.numStrata + numCoords
            let locusEnd = locusStart + format.numLoci
            for j in  locusStart ..< locusEnd {
                let alleles = row[j].components(separatedBy: ":")
                if alleles.count == 2 {
                    ind.loci[ header[j] ] = Locus(left: alleles[0], right: alleles[1])
                }
                else if alleles.count == 1 {
                    ind.loci[ header[j] ] = Locus(left: alleles[0], right: "")
                }
                else {
                    ind.loci[ header[j] ] = Locus()
                }
            }
            data.addIndividual(individual: ind, stratum: stratum, levels: levels)
        }
    }
    
    return data
}




