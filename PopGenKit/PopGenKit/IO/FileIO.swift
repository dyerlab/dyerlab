//
//  FileIO.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/3/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa
import MatrixKit

/**
 Constructs a random populaiton.
 
 This is mostly a convience function for making random populations.
 
 - Parameters:
    - nInd: The number of individuals to make (default=100)
    - nLoci: The number of loci (default=20)
    - alleles: A vector of alleles to use (default=["A","B","C"]).
 
 - Returns: A random `Population` object
 */
public func makeRandomPopulation(nInd: Int = 100, nLoci: Int = 20, alleles: [String] = ["A","B","C"] ) -> Population {
    let pop = Population()
    
    for i in 1...100 {
        let ind = Individual()
        ind.strata["Population"] = String("Pop-\(1+(i % 10))")
        for j in 1...20 {
            let alleles = ["A","B","C"]
            let geno:[String] = [ alleles.randomElement()!, alleles.randomElement()! ]
            ind.loci[ String("Loc-\(j)")] = Locus( geno )
        }
        pop.individuals.append( ind )
    }
    return pop
}


/**
 A convience function to fix crappy line endings from Winblows machines.
 
 - Parameters:
    - file: The raw file contents
 
 - Returns: A cleaned string without "\r" or "\n\n" line endings.
 */
func cleanRows( file: String ) -> String {
    var cleanfile = file
    cleanfile = cleanfile.replacingOccurrences(of: "\r", with: "\n")
    cleanfile = cleanfile.replacingOccurrences(of: "\n\n", with: "\n")
    return cleanfile
}


/**
 A conviencne function to grab a CSV file and make it into a `[[String]]` object.
 
 - Parameters:
    - data: The raw file contents
 
 - Returns: A separated `[[String]]` object
 */
func parseCSV(data:String) -> [[String]] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        result.append( row.components(separatedBy: "," ))
    }
    return result
}

/**
 Default function to load a CSV file that has genotype data in it.
 
 By default it is assumed that columns are separated by commas and that the order of
 data is Strata, Coordinates, External, Loci
 
 - Parameters:
    - path: The path to the file.
    - strata: The Number of strata in the file.
    - coords: The number of coordinates in the file.
    - external: The number of external data columns (interpreted as `Double`) in the file.
    - loci: The number of loci (as "A:B" encoding) in the file.
 
 - Returns: A fully constructed `Population` object.
 */
public func loadPopulation( path: String, strata: Int, coords: Int, external: Int, loci: Int ) -> Population {
    let pop = Population()
    
    var types = Array<IndividualDataType>()
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Strata, count:strata ))
    
    if coords == 2 {
        types.append( IndividualDataType.Latitude )
        types.append( IndividualDataType.Longitude )
    }
    
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.External, count:external ))
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Loci, count:loci ))
    
    print("TYPES:\n \(types)")
    
    
    let url = URL(fileURLWithPath: path)
    
    var data: [[String]] = []
    do {
        let contents = try String(contentsOf: url )
        let clean = cleanRows(file: contents)
        data = parseCSV(data: clean)
    } catch {
        print(error.localizedDescription)
    }
    
    // must have loaded in the stuff
    if data.count > 0 {
        let headers = data[0] as [String]
        for i in 1..<data.count {
            let theInd = Individual()
            let line = data[i]
            for j in 0..<line.count {
                let key = headers[j]
                let val = line[j]
                switch types[j] {
                case .Strata:
                    theInd.strata[key] = val
                case .Longitude:
                    theInd.coords.longitude = Double(val)!
                case .Latitude:
                    theInd.coords.latitude = Double(val)!
                case .External:
                    theInd.external[key] = Double(val)
                case .Loci:
                    theInd.loci[key] = Locus( val.components(separatedBy: ":")  )
                default:
                    print("unknown column type")
                }
            }
            pop.individuals.append(theInd)
        }
        
    }
    
    return pop
}


/**
 Convience function to load the example data set from Araptus attenuata
 
 - Returns: A fully constructed `Population` object with the example data set.
 */
public func loadArapat() -> Population {
    
    if let bundle = Bundle(identifier: "com.dyerlab.PopGenKit") {
        let path = bundle.path(forResource: "arapat", ofType: "csv")
        return loadPopulation(path: path!, strata: 4, coords: 2, external: 0, loci: 8)
    }
    else {
        return Population()
    }
}









