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
//  DataSet.swift
//
//  Created by Rodney Dyer on 7/19/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation
import CoreFoundation

/// The default data container for genetic data
public class DataSet: ObservableObject  {
    
    /// The root node of the
    //@Published public var strata: Stratum = Stratum(name: "All Individuals", level: "All")
    
    @Published var locales: [String:Locale]
    
    @Published var levels: [String]
    
    
    var count: Int {
        return self.locales["All", default: Locale(name: "All", level: "All")].count 
    }
    
    
    
    /// Creation Information
    init( levels: [String] = ["All"] ) {
        self.locales = ["All":Locale(name: "All", level: "All")]
        if !levels.contains("All") {
            self.levels = ["All"]
            self.levels.append(contentsOf: levels)
        }
        else {
            self.levels = levels
        }
        
    }
    
    func localeNamed( name: String) -> Locale {
        return self.locales[name, default: Locale(name: name, level: "")]
    }
    
    func localesForLevel( level: String ) -> [Locale] {
        return self.locales.values.filter( { $0.level == level } ).sorted( by: {$0.level < $1.level} )
    }
    
    /// Adding individuals and strata
    /// - Parameters:
    ///   - individual: A fully formed individual to add (ID, X, Y, Loci)
    ///   - stratum: An array of strata (nested, largest first, smallest last).
    ///   - levels: An array of level names for the stratum
    public func addIndividual( individual: Individual, stratum: [String], levels: [String] ) {
       
        var locale = self.locales["All"]!
        locale.addIndividual(individual: individual)
        
        for i in 0 ..< stratum.count {
            locale = self.locales[ stratum[i], default:  Locale(name: stratum[i], level: levels[i]) ]
            locale.addIndividual(individual: individual)
            self.locales[ stratum[i] ] = locale 
        }
        
        
            /*
        strata.addSubstrata(labels: stratum, levels: levels )
        
        do {
            try strata.addIndividual( individual, toStrata: stratum.last! )
        } catch {
            print("Unable to add individual")
        }
             */
        
    }
    
}




extension DataSet {
    
    static func defaultDataSet() -> DataSet {
        
        guard
            let path = Bundle.main.path(forResource: "Araptus", ofType: "csv")
        else {
            print("Could not load bundle from Framework")
            return DataSet(levels: ["All"])
        }
        
        let format = GenotypeFileFormat(strata: 2, loci: 8, coords: true)
        return importGenotypeFile(path: path, format: format)
        
    }
    
}


extension DataSet : CustomStringConvertible {
    
    public var description: String {
        
        var ret = "Data Set:\n"
        
        ret += " Levels:\n"
        for level in self.levels {
            let localeNames = self.localesForLevel(level: level ).map { $0.name }.joined(separator: ", ")
            
            ret += String(" - \(level): \(localeNames)\n")
        }
        
        
        
        ret += " Genetic:\n"
        ret += String(" - \( self.locales["All"]?.individuals.count ?? 0 ) individuals\n" )
        ret += String(" - \( self.locales["All"]?.individuals.first?.loci.keys.count ?? 0 ) loci\n")
        
        
        
        return ret
    }
    
}



