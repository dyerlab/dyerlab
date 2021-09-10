//
//  CGVector.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation



public extension CGVector {
    
    var length: CGFloat {
        return CGFloat( sqrtf( Float(self.dx * self.dx + self.dy * self.dy) ) )
    }
    
    
    init( pt1: CGPoint, pt2: CGPoint) {
        self.init(dx: (pt1.x - pt2.x),
                  dy: (pt1.y - pt2.y) )
    }
    
}
