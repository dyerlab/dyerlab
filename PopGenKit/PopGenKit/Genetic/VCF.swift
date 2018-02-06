//
//  VCF.swift
//  PopGenKit
//
//  Created by Rodney Dyer on 2/6/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


public struct VCFMetaData {
    public var Chromosome: String = ""
    public var Position: Int = 0
    public var Identification: String = ""
    public var Alleles: [String] = []
    public var Quality: String = ""
    public var Filter: String = ""
    public var Information: String = ""
    public var Format: String = ""
}


public class VCF {
    public var metaData: VCFMetaData
    public var snps: [SNP]
    public var count: Int {
        get {
            return snps.count
        }
    }
    
    public init(_ raw: String) {
        metaData = VCFMetaData()
        self.snps = [SNP]()
        let line = raw.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }
        print("line is \(line.count) elements long")
        if line.count > 9 {
            metaData.Chromosome = line[0]
            metaData.Position = Int( line[1] ) ?? 0
            metaData.Identification = line[2]
            metaData.Alleles = [ line[3] ]
            metaData.Alleles.append(contentsOf: line[4].components(separatedBy: ","))
            metaData.Quality = line[5]
            metaData.Filter = line[6]
            metaData.Information = line[7]
            metaData.Format = line[8]
            
            print("meta data is:")
            print("\(metaData)")

            for i in 9..<line.count {
                self.snps.append( SNP(raw: line[i], alleles: metaData.Alleles) )
            }
        } else {
            print("ERROR, LINE WAS TOO SHORT")
        }
        
        self.snps = [SNP]()
    }
    
}

