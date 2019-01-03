//
//  ViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {

    @IBOutlet weak var theView: SKView!
    var scene: GraphScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scene = GraphScene(size: theView.bounds.size )
        
        theView.showsFPS = true
        theView.showsFields = true
        theView.showsPhysics = true
        theView.showsNodeCount = true
        theView.presentScene(scene)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    
    override func keyDown(with event: NSEvent) {
        
        print("Key pressed is: \(event.keyCode)")
    }
    
    
}

