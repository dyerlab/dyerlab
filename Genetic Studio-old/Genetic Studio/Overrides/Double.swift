//
//  Double.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public extension Double {
    
    public static var random: Double {
        get {
            return Double( arc4random() ) / 0xFFFFFFFF
        }
    }
    
    public static func random( min: Double, max: Double ) -> Double {
        return Double.random * (max-min) + min
    }
}


