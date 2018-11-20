//
//  SCNVector.swift
//  popgraphAR
//
//  Created by Rodney Dyer on 11/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//
import Foundation
import SceneKit


public extension SCNVector3 {
    
    func distance(_ other: SCNVector3 ) -> Float {
        let xd = other.x - self.x
        let yd = other.y - self.y
        let zd = other.z - self.z
        let distance = Float(sqrt(xd * xd + yd * yd + zd * zd))
        
        return (distance)
    }
    
}

