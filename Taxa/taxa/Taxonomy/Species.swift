//
//  Species.swift
//  taxa
//
//  Created by Rodney Dyer on 2/26/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

class Species {
    let genus: String
    let species: String
    let samples: [Sample]
    
    init(family: String, genus: String, species: String ) {
        self.genus = genus.capitalized
        self.species = species.lowercased()
        self.samples = Array<Sample>()
    }
}


extension Species: CustomStringConvertible {
    var description: String {
        get {
            return String("\(self.genus) \(self.species)")
        }
    }
    
    
}
