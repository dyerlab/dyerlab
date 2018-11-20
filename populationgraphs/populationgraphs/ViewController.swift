//
//  ViewController.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {

    @IBOutlet weak var theView: SKView!
    var scene: GraphScene!
    var graph: Graph!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scene = GraphScene()
        scene.size = theView.frame.size
        scene.configForOpening()
        
        //scene.scaleMode = .aspectFill
        
        
        theView.showsFPS = true
        theView.showsNodeCount = true
        theView.ignoresSiblingOrder = true
        
        theView.presentScene(scene)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

