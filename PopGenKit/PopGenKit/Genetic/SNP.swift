//
//  VCF.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/6/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


/**
 SNP subclass that holds info on vcf loci loci
 
 This is a subclass for SNP loci read from a SNP VCF file.
 
 :author: Rodney J. Dyer
 */

class SNP : Locus {
    public var depth: Int
    
    /**
     Initializer for SNP locus.
     
     This assumes that the locus is formatted as GT:DP:AD
      - GT Genotype
      - DP Combimed depth across samples
      - AD Allele depth
     */
    init(raw: String, alleles: [String] ) {
        let line = raw.split(separator: ":")
        self.depth = 0
        self.allele_depth = (0,0)
        let alleles: [String]
        if line.count > 2 {
            alleles = line[0].components(separatedBy: "/")
            self.depth = Int( line[1] ) ?? 0
            let ad = line[2].components(separatedBy: ",")
        }
        else {
            alleles = []
        }
        super.init(alleles)

    }
}
