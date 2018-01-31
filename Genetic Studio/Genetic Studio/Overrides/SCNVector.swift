//
//  SCNVector.swift
//  Population Graphs
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

public extension SCNVector3 {
    func length() -> Double {
        return sqrt( Double(x*x + y*y + z*z ) )
    }
}

func - (l: SCNVector3, r: SCNVector3) -> SCNVector3 {
    return SCNVector3Make(l.x - r.x, l.y - r.y, l.z - r.z)
}
