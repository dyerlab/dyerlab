//
//  SCNVector3.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit


extension SCNVector3 {
    
    static func random( mn: CGFloat, mx: CGFloat ) -> SCNVector3 {
        return SCNVector3Make(CGFloat.random(in: mn...mx),
                              CGFloat.random(in: mn...mx),
                              CGFloat.random(in: mn...mx) )
    }
    
    public static func + (left: SCNVector3, right: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make(left.x + right.x, left.y+right.y, left.z+right.z)
    }
    
    public static func - (left: SCNVector3, right: SCNVector3 ) -> SCNVector3 {
        return SCNVector3Make(left.x-right.x, left.y-right.y, left.z-right.z)
    }
    
    public static func / (left: SCNVector3, right: CGFloat ) -> SCNVector3 {
        return SCNVector3Make(left.x/right, left.y/right, left.z/right)
    }
    
    public static func * (left: SCNVector3, right: CGFloat) -> SCNVector3 {
        return SCNVector3Make(left.x*right, left.y*right, left.z*right)
    }
    
    public func distanceTo(_ other: SCNVector3 ) -> CGFloat {
        let xd = other.x - self.x
        let yd = other.y - self.y
        let zd = other.z - self.z
        return CGFloat( sqrt(xd*xd + yd*yd + zd*zd) )
    }
    
    public func midpoint(_ other: SCNVector3 ) -> SCNVector3 {
        let ret = SCNVector3Make( (other.x + self.x ) / 2.0 ,
                                  (other.y + self.y ) / 2.0 ,
                                  (other.z + self.z ) / 2.0 )
        return ret
    }
    
    public func length() -> Float {
        return sqrtf( Float(x*x + y*y + z*z) )
    }
    
    public func normalized() -> SCNVector3 {
        return (self.length() == 0) ? self :  self / CGFloat(self.length())
    }
    
    
    public func abs() -> SCNVector3 {
        return SCNVector3Make( CGFloat.abs(x), CGFloat.abs(y), CGFloat.abs(z) )
    }
    
    
    static func lineEulerAngles( vector: SCNVector3 ) -> SCNVector3 {
        let height = vector.length()
        let lxz = sqrtf(Float(vector.x * vector.x + vector.z * vector.z))
        let pitchB = vector.y < 0 ? Float.pi - asinf(lxz/height) : asinf(lxz/height)
        let pitch = vector.z == 0 ? pitchB : sign(Float(vector.z)) * pitchB
        
        var yaw: Float = 0
        if vector.x != 0 || vector.z != 0 {
            let inner = Float(vector.x) / (height * sinf(Float(pitch)))
            if inner > 1 || inner < -1 {
                yaw = Float.pi / 2
            } else {
                yaw = asinf(inner)
            }
        }
        return SCNVector3(CGFloat(pitch), CGFloat(yaw), 0)
    }
    
    
}



public func limit(vec: SCNVector3, mn: CGFloat, mx: CGFloat ) -> SCNVector3 {
    
    let ret = SCNVector3(x: ( vec.x < mn ) ? mn : ((vec.x > mx) ? mx : vec.x),
                         y: ( vec.y < mn ) ? mn : ((vec.y > mx) ? mx : vec.y),
                         z: ( vec.z < mn ) ? mn : ((vec.z > mx) ? mx : vec.z))
    
    return ret
}



public func smallestElements( vec1: SCNVector3, vec2: SCNVector3) -> SCNVector3 {
    return SCNVector3(x: Swift.min(vec1.x, vec2.x), y: Swift.min(vec1.y, vec2.y), z: Swift.min(vec1.z, vec2.z) )
}



public func largestElements( vec1: SCNVector3, vec2: SCNVector3) -> SCNVector3 {
    return SCNVector3(x: Swift.max(vec1.x, vec2.x), y: Swift.max(vec1.y, vec2.y), z: Swift.max(vec1.z, vec2.z) )
}


