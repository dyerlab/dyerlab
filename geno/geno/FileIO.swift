//
//  FileIO.swift
//  geno
//
//  Created by Rodney Dyer on 11/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

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
func loadPopulation( path: String, strata: Int, coords: Int, external: Int, loci: Int ) -> Population {
    let pop = Population()
    
    var types = Array<IndividualDataType>()
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Strata, count:strata ))
    
    if coords == 2 {
        types.append( IndividualDataType.Latitude )
        types.append( IndividualDataType.Longitude )
    }
    
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.External, count:external ))
    types.append(contentsOf: Array<IndividualDataType>(repeating:IndividualDataType.Loci, count:loci ))
    
    //print("TYPES:\n \(types)")
    
    
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
                    theInd.coordinate?.longitude = Double(val)!
                case .Latitude:
                    theInd.coordinate?.latitude = Double(val)!
                case .External:
                    theInd.external[key] = Double(val)
                case .Loci:
                    theInd.loci[key] = Locus(val: val.components(separatedBy: ":")  )
                default:
                    print("unknown column type")
                }
            }
            pop.addIndividual(theInd)
        }
        
    }
    
    return pop
}


/**
 Convience function to load the example data set from Araptus attenuata
 
 - Returns: A fully constructed `Population` object with the example data set.
 */
func loadArapat() -> Population {
    
    if let bundle = Bundle(identifier: "com.dyerlab.geno") {
        let path = bundle.path(forResource: "arapat", ofType: "csv")
        return loadPopulation(path: path!, strata: 4, coords: 2, external: 0, loci: 8)
    }
    else {
        return Population()
    }
}





/**
 Simple function for reading in genotype from VCF GT:DP:AD formats
 
 - Returns: A fully constructed `Locus` object.
 */

func vcf2Locus( val: String, format: String, alleles: [String] ) -> Locus {
    //let formats = format.components(separatedBy: ":")
    let vals = val.components(separatedBy: ":")
    let geno = vals.first?.components(separatedBy: "/")
    if geno?.count == 2 && geno?.first != "." {
        let g: [String] = [ alleles[ Int((geno?.first)!)!],
                            alleles[ Int((geno?.last)!)! ]]
        return Locus(val: g )
    }
    return Locus()
}



func loadVCF( path: String) -> Population {
    let thePop = Population()
    
    let url = URL(fileURLWithPath: path)
    
    
    do {
        var contents = try String(contentsOf: url )
        let raw = cleanRows(file: contents).components(separatedBy: "\n")
        contents = ""
        var genosStartAt = -1
        
        for line in raw[0...100] {
            
            
            
            if line.hasPrefix("##") {
                print(line)
            }
            else {
                
                let vec = line.components(separatedBy: "\t").filter {$0 != "" }
                
                if vec.count > genosStartAt {
                    if vec.first == "#CHROM" {
                        genosStartAt = (vec.firstIndex(of: "FORMAT")?.advanced(by: 1))!
                        
                        for i in genosStartAt..<vec.count {
                            let id = vec[i].components(separatedBy: "_")
                            var pop = "NONE"
                            var ident="\(i)"
                            if id.count == 2 {
                                pop = id.first!
                                ident = id.last!
                            }
                            let ind = Individual()
                            ind.strata["Population"] = pop
                            ind.strata["ID"] = ident
                            thePop.individuals.append( ind )
                        }
                    } else {
                        let locusName = vec[..<3].joined(separator: ":")
                        for i in genosStartAt..<vec.count {
                            let alleles = [vec[3], vec[4]]
                            let theLoc = vcf2Locus(val: vec[i],
                                                   format: vec[ genosStartAt-1 ],
                                                   alleles: alleles)
                            thePop.individuals[(i-genosStartAt)].loci[locusName] = theLoc
                        }
                    }
                }
            }
        }
        
    } catch {
        print(error.localizedDescription)
    }
    
    return thePop
}
