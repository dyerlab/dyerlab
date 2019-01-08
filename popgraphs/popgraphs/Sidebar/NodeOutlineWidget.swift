//
//  NodeOutlineWidget.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/8/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class NodeOutlineWidget: NSView {

    @IBOutlet weak var nodeNameLabel: NSTextField!
    @IBOutlet weak var nodeSizeLabel: NSTextField!
    @IBOutlet weak var nodeDegreeLabel: NSTextField!
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
}
