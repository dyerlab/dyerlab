//
//  NodeSprite.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 9/25/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit


func makeGraphNode( radius: CGFloat ) -> SKShapeNode {
    
    let path = CGMutablePath()
    path.addArc(center: CGPoint.zero,
                radius: radius,
                startAngle: 0,
                endAngle: CGFloat.pi * 2,
                clockwise: true)
    let node = SKShapeNode(path: path)
    node.lineWidth = 1
    node.fillColor = .blue
    node.strokeColor = .white
    node.glowWidth = 0.5

    return node
    
}


class GraphNode : SKShapeNode {
    var label: SKLabelNode
    
    init(size: CGFloat = 10.0, name: String = "Bob"){
        
        // Make the label
        label = SKLabelNode(fontNamed: "Chalkduster")
        
        super.init()
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint.zero,
                                             size: CGSize(width: size, height: size) ),
                           transform: nil )
        self.fillColor = .gray
        
        // Set up the label
        label.text = name
        label.fontSize = 12.0
        label.fontColor = SKColor.white
        label.position = CGPoint(x: label.frame.size.width, y: label.frame.size.height )
        self.addChild(label)
        
        // Set up the physics body
        self.physicsBody = SKPhysicsBody(circleOfRadius: size)
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.density = 1.0
        self.physicsBody!.isDynamic = true
        
        position = CGPoint(x: 100, y: 100)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
