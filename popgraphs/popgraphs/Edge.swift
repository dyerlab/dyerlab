//
//  Edge.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit


class Edge : SKShapeNode {
    var node1: Node
    var node2: Node
    var spring: SKPhysicsJointSpring
    
    
    init( n1: Node, n2: Node ) {
        self.node1 = n1
        self.node2 = n2
        
        spring = SKPhysicsJointSpring.joint(withBodyA: node1.physicsBody!,
                                                bodyB: node2.physicsBody!,
                                                anchorA: CGPoint(x: 0.0, y: 0.0),
                                                anchorB: CGPoint(x: 0.0, y: 0.0) )
        
        spring.frequency = 1.0
        spring.damping = 0.98

        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
