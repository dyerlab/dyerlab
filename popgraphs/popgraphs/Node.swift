//
//  Node.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class Node: SKSpriteNode {

    let nodeCategoryBitmask: UInt32 = 0x1 << 1
    
    init() {
        let texture = SKTexture(imageNamed: "Node")
        super.init( texture: texture, color: NSColor.white, size: texture.size() )
        
        // Make the physics body
        physicsBody = SKPhysicsBody(circleOfRadius: texture.size().width/2.0 )
        self.physicsBody?.categoryBitMask = nodeCategoryBitmask
        self.physicsBody?.contactTestBitMask = nodeCategoryBitmask
        self.physicsBody?.collisionBitMask = nodeCategoryBitmask
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = true
        
        // Everyone gets a repulsion field
        let repulsionField = SKFieldNode.radialGravityField()
        repulsionField.strength = -0.05
        repulsionField.falloff = 0.001
        repulsionField.isEnabled = true
        self.addChild(repulsionField)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension Node {
    
    func rescale( radius: CGFloat ) {
        self.size = CGSize(width: radius, height: radius)
    }
}
