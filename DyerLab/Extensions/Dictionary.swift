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
//  Dictionary
//  Dictionary.swift
//
//  Created by Rodney Dyer on 8/17/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

extension Dictionary where Value: Comparable {
    
    /// Returning sorted by value 
    public var sortedByValue: [(Key, Value)] {
        return Array(self).sorted { $0.1 < $1.1 }
    }
    
}


extension Dictionary where Key: Comparable {
    
    /// Returning sorted by key
    public var sortedByKey: [(Key, Value)] {
        return Array( self ).sorted { $0.0 < $1.0 }
    }
}


extension Dictionary {
    mutating func merge( dict: [Key:Value]){
        for (k,v) in dict {
            updateValue(v, forKey: k)
        }
    }
}
