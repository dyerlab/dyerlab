//
//  GraphScene.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphScene: SKScene {
    
    let startupLabel = SKLabelNode(text: "p  o  p  g  r  a  p  h  s")
    let defaultGraph = Graph.makeHumanGraph()

}



// MARK: Setup Gravity Models

extension GraphScene  {
    
    func configForOpening() {
        
        self.backgroundColor = NSColor.windowBackgroundColor
        
        startupLabel.position = CGPoint(x: size.width/2, y: size.height/2)
        startupLabel.fontColor = NSColor.alternateSelectedControlColor
        startupLabel.fontSize = 36.0
        addChild(startupLabel)
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame )
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx: 0, dy: -4.8)
        
        defaultGraph.recenter(size: self.size)
        self.addChild(defaultGraph.root)
                
    }
    
    
    func configForNetwork() {
        
    }
    
}


extension GraphScene : SKPhysicsContactDelegate {
    
}




