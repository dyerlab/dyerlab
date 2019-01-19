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
    var temperature: CGFloat = 100.0
    var timer: Timer?
    
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
    
    
    
    // Register for an "ITEM MOVED"
    func itemMoved() {
        if (self.timer?.isValid)! {
            return
        }
        
        self.timer = Timer(timeInterval: 0.1, target: self, selector: #selector(timerFired(sender:)), userInfo: nil, repeats: true)
    }
    
}


// MARK: Stuff for Layouts
extension PopgraphView {
    
    @objc func timerFired(sender: Any?) {
        
        if let scene = self.skView.scene as? GraphScene {
            temperature = (temperature >= 0.5) ? 0.999 * temperature : 0.45
            if !scene.applyForces(temp: temperature) {
                // kill timer
                
                self.timer?.invalidate()
                
                temperature = 100.0
            }
        }
        else {
            timer?.invalidate()
        }
    }
    
}
