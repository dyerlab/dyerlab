//
//  GraphScene.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphScene: SKScene {
    
    var graph: Graph?
    
    override init(size: CGSize ) {
        
        super.init(size: size)
        
        print("Init of Scene (\(size))")
        
        graph = Graph(scene: self)
        graph!.makeNode(radius: 25, label: "Bob")
        graph!.makeNode(radius: 12, label: "Alice")
        graph!.makeNode(radius: 18, label: "Darius")
        graph!.makeEdge(label1: "Bob", label2: "Alice")
        graph!.makeEdge(label1: "Bob", label2: "Darius")
        graph!.makeEdge(label1: "Darius", label2: "Alice")
        
        
        self.scaleMode = .resizeFill

        self.makePhysicsBody(size: size)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension GraphScene {
    
    public func makePhysicsBody(size: CGSize ) {
        let borderBody = SKPhysicsBody(edgeLoopFrom: CGRect(origin: CGPoint(x: 0, y: 0), size: size) )
        borderBody.friction = 2
        self.physicsBody = borderBody
    }
}


extension GraphScene {
    
}
