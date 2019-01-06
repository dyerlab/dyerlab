//
//  PopgraphView.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/6/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit


class PopgraphView: NSView {
    
    @IBOutlet var contentView: NSView!
    @IBOutlet weak var skView: SKView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    
    public func commonInit() {
        Bundle.main.loadNibNamed("PopgraphView", owner: self, topLevelObjects: nil)
        //contentView.removeFromSuperview()
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .width, .height ]
        
        skView.ignoresSiblingOrder = true
        skView.showsFPS = true
        skView.showsNodeCount = true
        
    }
    

    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
