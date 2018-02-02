//
//  Locus.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public class Locus {
    var alleles = [String]()
    var description : String {
        get {
            return self.alleles.joined(separator: ":")
        }
    }
    
    init( alleles : [String] ){
        self.alleles = alleles.sorted()
    }
}
