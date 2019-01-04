//
//  GraphView.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphView: SKView {
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        self.showsFPS = true
        self.showsFields = true
        self.showsPhysics = true
        self.showsNodeCount = true
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        self.showsFPS = true
        self.showsFields = true
        self.showsPhysics = true
        self.showsNodeCount = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    

    override func viewDidEndLiveResize() {
        print("Resizing")
        
        //(self.scene! as! GraphScene).makePhysicsBody( size: self.frame.size )
    }
    
    
}
