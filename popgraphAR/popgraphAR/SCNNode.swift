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
        shape.firstMaterial!.diffuse.contents = UIColor.red
        shape.firstMaterial!.specular.contents = UIColor.white
        return shape
    }
    
    
    static func makeGraphNode( size: CGFloat, label: String, position: SCNVector3 ) -> SCNNode {
        let sphere = SCNSphere(radius: size )
        let node = SCNNode()
        node.geometry = sphere
        node.position = position
        
        return node        
    }

}
