//
//  Node.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

let repulsionFieldCategory: UInt32 = 0x1 << 1

class Node : SKSpriteNode {

    public var labelNode: SKLabelNode
    
    init(size: CGFloat, color: NSColor, label: String) {
        labelNode = SKLabelNode(text: label)
        labelNode.position.y = size
        labelNode.position.x = size
        labelNode.fontColor = NSColor.alternateSelectedControlColor
        labelNode.fontSize = 18.0
        
        
        super.init(texture: nil,
                   color: color,
                   size: CGSize(width: size, height: size) )
        self.position = CGPoint(x: CGFloat.random(in: 0.0...1.0),
                                y: CGFloat.random(in: 0.0...1.0))
        self.addChild(labelNode)
        
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: size/2.0)
        self.physicsBody?.restitution = 1.0
        self.physicsBody?.linearDamping = 0.75
        self.physicsBody?.angularDamping = 0.75
        self.physicsBody?.categoryBitMask = repulsionFieldCategory

        // set up negative gravity field
//        let shield = SKFieldNode.radialGravityField()
//        shield.strength = -5
//        shield.categoryBitMask = repulsionFieldCategory
//        shield.region = SKRegion( radius: 50 )
//        shield.falloff = 4
//        shield.run(SKAction.sequence([
//            SKAction.strength(to: 0, duration: 2.0),
//            SKAction.removeFromParent()
//            ]))
//        
//        self.addChild(shield)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



