//
//  GraphNode.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/20/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import SpriteKit

class GraphNode: SKShapeNode {
    var size: CGFloat = 10.0
    
    // MARK: - INIT
    override init() {
        super.init()
        self.path = CGPath(roundedRect: CGRect(x: 0, y: 0, width: self.size, height: self.size),
                           cornerWidth: self.size/4,
                           cornerHeight: self.size/4,
                           transform: nil)
        self.position = CGPoint(x: 0, y: 0)
        self.fillColor = NSColor.red
        self.strokeColor = NSColor.white
        self.lineWidth = 1.5
        self.isAntialiased = true

        self.isUserInteractionEnabled = true
        self.name = "node"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(with event: NSEvent) {
        print("touched")
    }
}
