//
//  Int.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


public extension Int {
    
    public static func random( max: Int ) -> Int {
        return Int( arc4random_uniform( UInt32(max) ) )
    }
}
