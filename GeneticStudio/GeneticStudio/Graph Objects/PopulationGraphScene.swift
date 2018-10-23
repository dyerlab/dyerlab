//
//  GraphScene.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/20/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import SpriteKit

class PopulationGraphScene: SKScene {
    
    var node = GraphNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)        
        self.addChild(node)
    }
    
    
    override func touchesMoved(with event: NSEvent) {
        
        let pos = event.location(in: self)
        print("Touch: \(pos.x) and \(pos.y)")
        
        node.position = event.location(in: self)
        
        
        
        
        
    }
}
