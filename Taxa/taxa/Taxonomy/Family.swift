//
//  Family.swift
//  taxa
//
//  Created by Rodney Dyer on 2/26/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


class Family {
    let name: String
    let species: [Species]
    var count: Int {
        get {
            return species.count
        }
    }
    
    init( name: String ) {
        self.name = name
        self.species = Array<Species>()
    }
}
