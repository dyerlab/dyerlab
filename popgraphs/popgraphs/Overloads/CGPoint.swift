//
//  CGPoint.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation



extension CGPoint {
    
    func distance(to other: CGPoint) -> CGFloat {
        var ret = pow( (self.x-other.x), 2.0) + pow((self.y-other.y), 2.0)
        if ret > 0 {
            ret = sqrt(ret)
        } else {
            ret = 1.0 
        }
        return CGFloat(ret)
    }
    
    
    static func +( lhs: CGPoint, rhs: CGPoint ) -> CGPoint {
        return CGPoint(x: lhs.x+rhs.x, y: lhs.y+rhs.y)
    }
    
    static func -( lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    static func /( lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        return CGPoint( x: lhs.x / rhs, y: lhs.y / rhs )
    }
    
    static func *( lhs: CGPoint, rhs: CGFloat ) -> CGPoint {
        return CGPoint( x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
}
