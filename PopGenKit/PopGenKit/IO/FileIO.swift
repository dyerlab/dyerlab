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

public func makeRandomPopulation() -> Population {
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


func cleanRows( file: String ) -> String {
    var cleanfile = file
    cleanfile = cleanfile.replacingOccurrences(of: "\r", with: "\n")
    cleanfile = cleanfile.replacingOccurrences(of: "\n\n", with: "\n")
    return cleanfile
}

func parseCSV(data:String) -> [[String]] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        result.append( row.components(separatedBy: "," ))
    }
    return result
}

public func loadPopulation( path: String, strata: Int, coords: Int, external: Int, loci: Int ) -> Population {
    let pop = Population()
    
    var types = Array<IndividualDataType>()
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Strata, count:strata ))
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Coordinates, count:coords ))
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.External, count:external ))
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Loci, count:loci ))
    
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
                case .Coordinates:
                    theInd.coords[key] = Double(val)
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

public func loadArapat() -> Population {
    
    if let bundle = Bundle(identifier: "com.dyerlab.PopGenKit") {
        let path = bundle.path(forResource: "arapat", ofType: "csv")
        return loadPopulation(path: path!, strata: 4, coords: 2, external: 0, loci: 8)
    }
    else {
        return Population()
    }
    
    
}
