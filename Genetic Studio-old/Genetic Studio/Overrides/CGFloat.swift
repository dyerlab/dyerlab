//
//  CGFloat.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public extension CGFloat {
    
    public static var random: CGFloat {
        get {
            return CGFloat( arc4random() ) / 0xFFFFFFFF
        }
    }
    
    public static func random( min: CGFloat, max: CGFloat ) -> CGFloat {
        return CGFloat.random * (max-min) + min
    }
}

