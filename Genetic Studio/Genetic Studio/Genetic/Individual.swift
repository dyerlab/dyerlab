//
//  Individual.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


public class Individual {
    
    var strata: [String:String]
    var loci: [String:Locus]
    
    init() {
        self.strata = [String:String]()
        self.loci = [String:Locus]()
    }
    
    func getData( key: String ) -> String {
        if self.strata.keys.contains(key ) {
            return self.strata[key]!
        }
        else if self.loci.keys.contains(key) {
            return String("\(self.loci[key]!.description)")
        }
        else {
            return ""
        }
    }
}
