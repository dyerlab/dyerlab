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
//  AlleleMask.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation


/// Simple rename to make it clear that masks are T/F
public enum AlleleMaskEnum: Int, Codable {
    
    /// No masking
    case None
    
    /// Left allele is masked
    case Left
    
    /// Right allele is masked
    case Right
    
    /// Error in determining mask
    case Error
    
}


