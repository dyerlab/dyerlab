//
//  SCNGeometry.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit



extension SCNNode {

    class func graphNode( size: CGFloat ) -> SCNGeometry {
        let shape = SCNSphere(radius: size)
        shape.firstMaterial!.diffuse.contents = NSColor.red
        shape.firstMaterial!.specular.contents = NSColor.white
        return shape
    }

}
