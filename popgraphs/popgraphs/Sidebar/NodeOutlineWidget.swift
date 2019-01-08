//
//  NodeOutlineWidget.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/8/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class NodeOutlineWidget: NSView {

    @IBOutlet var contentView: NodeOutlineWidget!
    @IBOutlet weak var nodeNameLabel: NSTextField!
    @IBOutlet weak var nodeSizeLabel: NSTextField!
    @IBOutlet weak var nodeDegreeLabel: NSTextField!
    @IBOutlet weak var colorWell: NSColorWell!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("NodeOutlineWidget", owner: self, topLevelObjects: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .width, .height ]
    }
    
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    public func setData( node: Node ) {
        nodeNameLabel.stringValue = node.name!
        nodeSizeLabel.stringValue = String("\(node.size.width)")
        nodeDegreeLabel.stringValue = String("\(node.degree)")
    }
    
}
