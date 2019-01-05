//
//  SidebarView.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/5/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class SidebarView: NSView {
    
    @IBOutlet var contentView: NSView!
    @IBOutlet weak var titleLabel: NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SidebarView", owner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .width, .height ]
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
