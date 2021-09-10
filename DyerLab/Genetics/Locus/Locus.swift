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
//  Genotype.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/// A generic locus object
public class Locus: Codable, Equatable, CustomStringConvertible, ObservableObject {
    
    /// Diploid allele, frist postiion
    @Published public var left = String()
    
    /// Diploid allele, second position
    @Published public var right = String()
    
    /// Current Making State
    public var mask: AlleleMaskEnum = .None
    
    /// Determines if the mask is currently being deployed
    public var maskInEffect: Bool = false


    /// Enum for Codable Configuration for stored properties.
    enum CodingKeys: String, CodingKey {
        case left = "left"
        case right = "right"
        case mask = "mask"
        case maskInEffect = "masking"
    }
    
    
    /// Determine current ploidy
    public var ploidy: PloidyEnum {
            return PloidyEnum(rawValue: alleles.count )!
    }
    
    /// Display of locus with masking
    public var description: String {
        let loc = self.alleles.joined(separator: ":")
        return loc
    }    
    
    /// Public access to string data representing alleles
    public var alleles: [String] {
        
            let ret: [String]
            if maskInEffect {
                switch self.mask {
                case .Left:
                    ret = [right]
                case .Right:
                    ret = [left]
                default:
                    ret = [left, right]
                }
            } else {
                ret = [ left, right ]
            }
            
            return ret.filter { $0 != "" }
        
    }

    /// Flag to determine if any alleles are unmasked
    public var isMissing: Bool {
        return self.alleles.count == 0
    }
    
    /// A locus with >1 allele type is considered a heterozygote
    public var isHeterozygote: Bool {
        get {
            return Set( self.alleles ).count > 1
        }
    }
    
    
    /// Default initiator
    init() {}
    
    /// Initiation using 2-alleels
    init( left: String = "", right: String = "" ) {
        if left < right {
            self.left = left
            self.right = right
        }
        else {
            self.left = right
            self.right = left
        }
    }
    
    

    /// Init from decoder
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self )
        self.left = try values.decode(String.self, forKey: .left )
        self.right = try values.decode(String.self, forKey: .right )
        self.mask = try values.decode(AlleleMaskEnum.self, forKey: .mask )
        self.maskInEffect = try values.decode( Bool.self, forKey: .maskInEffect)
        
    }
   
    /// save to encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self )
        try container.encode( self.left, forKey: .left )
        try container.encode( self.right, forKey: .right )
        try container.encode( self.mask, forKey: .mask )
        try container.encode( self.maskInEffect, forKey: .maskInEffect )
    }
    
    
    /// Overload of equality operator
    public static func == (lhs: Locus, rhs: Locus) -> Bool {
        return lhs.left == rhs.left && lhs.right == rhs.right && lhs.mask == rhs.mask
    }
    
    
}







// MARK: - Parent/Offspring Features
extension Locus {
    
    public func pullParent( parent: Locus )  {
        
        if self.ploidy == .Diploid && parent.ploidy == .Diploid {
            
            /// Identical genotype
            if self == parent {
                
                // Cannot separate out equal heterozygotes
                if isHeterozygote {
                    mask = .Error
                }
                
                // Not heterozygote, so hide right
                else {
                    mask = .Right
                }
                
            } else {
                
                // First offspring allele in parent
                if left == parent.left || left == parent.right {
                    mask = .Left
                }
                // Second offspring allele in parent
                else if right == parent.left || right == parent.right {
                    mask = .Right
                }
                // Neither offspring allele in parent
                else {
                    mask = .Error
                }
                
            }
        }
    }
    
    
}


extension Locus {
    
    /// Production of an example Locus object
    /// - Parameters:
    ///   - ploidy: Level of ploidy for the locus
    ///   - mask: Is it masked?
    ///   - heterozygote: Heterozygote or homozygote
    ///   - masking: Are alleles masked
    /// - Returns: A fully formed ``Locus`` object
    public static func exampleLocus( ploidy: PloidyEnum, mask: AlleleMaskEnum, heterozygote: Bool, masking: Bool = false ) -> Locus {
        
        if ploidy == .Missing {
            return Locus()
        }
        else if ploidy == .Haploid {
            return Locus(left: "A", right: "")
        }
        
        let loc = heterozygote ? Locus(left: "A", right: "B") : Locus(left: "A", right: "A")
        loc.mask = mask
        loc.maskInEffect = masking 
        return loc
        
    }

}



