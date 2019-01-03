//
//  GraphScene.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphScene: SKScene {

   

    override init(size: CGSize) {
        super.init(size: size)
        
        print("Initializing at: \(size)")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func config() {
        
//        backgroundColor = NSColor.white
//
//        let staticNode = SKSpriteNode(color: .red,
//                                      size: size)
//        let dynamicNode = SKSpriteNode(color: .blue,
//                                       size: size)
//
//        staticNode.physicsBody = SKPhysicsBody(rectangleOf: size)
//        staticNode.physicsBody?.isDynamic = false
//        staticNode.position = CGPoint(x: 250, y: 300)
//
//        dynamicNode.physicsBody = SKPhysicsBody(rectangleOf: size)
//        dynamicNode.position = CGPoint(x: 250, y: 200)
//
//        addChild(staticNode)
//        addChild(dynamicNode)
//
//        let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
//                                                bodyB: dynamicNode.physicsBody!,
//                                                anchorA: staticNode.position,
//                                                anchorB: dynamicNode.position)
//
//        spring.frequency = 0.5
//        spring.damping = 0.2
//
//        physicsWorld.add(spring)
//
//        let move = SKAction.moveBy(x:0, y: 200,
//                                   duration: 1)
//        staticNode.run(move)
    }
    
}
