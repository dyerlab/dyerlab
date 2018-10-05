//
//  GraphEdge.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 9/25/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

class GraphEdge {
    var node1: GraphNode
    var node2: GraphNode
    var spring: SKPhysicsJointSpring
    
    
    init(n1: GraphNode, n2: GraphNode, weight: Double = 1.0 ) {
        node1 = n1
        node2 = n2
        

        spring = SKPhysicsJointSpring.joint(withBodyA: n1.physicsBody!,
                                                    bodyB: n2.physicsBody!,
                                                    anchorA: n1.position,
                                                    anchorB: n2.position)
        spring.frequency = 0.5
        spring.damping = 0.5
        
    }
    
    
}
