//
//  MapView.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/9/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class MapView: NSView {

    
    @IBOutlet var contentView: MapView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("MapView", owner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .width, .height ]
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
