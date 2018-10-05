//
//  GraphScene.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 9/25/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit



class GraphScene : SKScene {
    
    
    func configure() {
        
        //let staticNode = SKSpriteNode( color: .red, size: size )
        //let staticNode = SKShapeNode(rect: CGRect(x: 0, y: 0, width: 50, height: 50), cornerRadius: 25.0)
        //staticNode.fillColor = .green
        let staticNode = GraphNode(size: 50, name: "Robert the Bruce")
        let dynamicNode = GraphNode( size: 20, name: "Coer")
               
        
//        staticNode.physicsBody = SKPhysicsBody(rectangleOf: size)
//        staticNode.physicsBody?.isDynamic = false
//        staticNode.position = CGPoint(x: 250, y: 250)
//
//        dynamicNode.physicsBody = SKPhysicsBody(rectangleOf: size)
//        dynamicNode.position = CGPoint(x: 250, y: 250)

        
        self.addChild( staticNode )
        self.addChild( dynamicNode )

        let springConnection = GraphEdge( n1: staticNode, n2: dynamicNode)
        self.physicsWorld.add( springConnection.spring )
        
        
        
//        let spring = SKPhysicsJointSpring.joint(withBodyA: staticNode.physicsBody!,
//                                                bodyB: dynamicNode.physicsBody!,
//                                                anchorA: staticNode.position,
//                                                anchorB: dynamicNode.position)
        
        //spring.frequency = 0.75
        //spring.damping = 0.02
        
//        staticNode.physicsBody?.affectedByGravity = false
//        dynamicNode.physicsBody?.affectedByGravity = false
        
        //self.physicsWorld.add(spring)
        
        
//        let move = SKAction.moveBy(x: 0, y: 200, duration: 1)
//        staticNode.run(move)

        let moveNode = SKAction.moveBy(x: 200, y: 200, duration: 2)
        
        staticNode.run( moveNode )
    }
    
}
