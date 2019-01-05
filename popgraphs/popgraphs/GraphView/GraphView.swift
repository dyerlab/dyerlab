//
//  GraphView.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit
import MapKit

class GraphView: NSView {
    
    @IBOutlet var contentView: GraphView!
    @IBOutlet weak var skView: SKView!
    
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    
    func commonInit() {
        
        // load from xib
        Bundle.main.loadNibNamed("GraphView", owner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .width, .height ]
        
        
        // Format the SKView
//        skView.showsFPS = true
//        skView.showsFields = true
//        skView.showsPhysics = true
//        skView.showsNodeCount = true
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }

    
    
}
