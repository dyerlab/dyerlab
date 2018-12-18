//
//  Locus.swift
//  geno
//
//  Created by Rodney Dyer on 11/22/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

class Locus {
    var alleles: [String]
    
    init() {
        self.alleles = [String]()
    }
    
    init(A: String, B: String ) {
        self.alleles = [String]()
        setAlleles(vals: [A,B] )
    }
    
    init( val : [String] ) {
        self.alleles = [String]()
        setAlleles(vals: val)
    }
}



// MARK: Properties of the Object

extension Locus {
    
    func isEmpty() -> Bool {
        return ploidy() == 0
    }
    
    func ploidy() -> Int {
        return alleles.count
    }
    
    func isHeterozygote() -> Bool {
        return Set(self.alleles).count > 1
    }
}




extension Locus {
    
    func setAlleles( val: String ) {
        if val.contains(":") {
            setAlleles(vals: val.components(separatedBy: ":") )
        }
        else {
            setAlleles(vals: [val] )
        }
    }
    
    func setAlleles( vals: [String] ) {
        self.alleles = vals.sorted().compactMap { $0 }
    }
}



// MARK: Equatable Extension

extension Locus: Equatable {
    
    static func == (lhs: Locus, rhs: Locus) -> Bool {
        return lhs.alleles == rhs.alleles
    }
    
}


// MARK: StringConvertable Extension

extension Locus: CustomStringConvertible {
    
    var description: String {
        return self.alleles.joined(separator: ":")
    }
    
}

