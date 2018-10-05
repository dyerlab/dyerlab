//
//  FloorNode.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 9/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit


class FloorNode: SCNNode {
    override init() {
        super.init()
        
        let geo = SCNFloor()
        geo.reflectivity = 0.5
        self.geometry = geo
        
        let material = SCNMaterial()
        material.diffuse.contents = NSColor.green
        geo.materials = [material]

//        self.geometry = geo
//        self.eulerAngles = SCNVector3(x: CGFloat(GLKMathDegreesToRadians(-90)), y: 0, z: 0)
//        self.position = SCNVector3(x: 0, y: -0.5, z: 0)
//
        let floorshape = SCNPhysicsShape(geometry: geo, options: nil)
        let floorbody = SCNPhysicsBody(type: .static , shape: floorshape)
        floorbody.friction = 0.5
        floorbody.restitution = 0.5
        floorbody.rollingFriction = 0.1
        floorbody.damping = 0.1
        floorbody.angularDamping = 0.1
        floorbody.charge = 0.0
        floorbody.isAffectedByGravity = true
        floorbody.allowsResting = true
        floorbody.categoryBitMask = 5
        floorbody.collisionBitMask = -3
        self.physicsBody = floorbody
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

