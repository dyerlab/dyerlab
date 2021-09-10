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
//  PloidyEnum.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

public enum PloidyEnum: Int, Codable {
    
    /// Empty locus
    case Missing
    
    /// Only one allele showing
    case Haploid
    
    /// Both alleles showing
    case Diploid
    
    
}
