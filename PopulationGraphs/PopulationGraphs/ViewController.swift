//
//  ViewController.swift
//  PopulationGraphs
//
//  Created by Rodney Dyer on 9/22/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {


    @IBOutlet var theView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let graphScene = GraphScene()
        graphScene.size = theView.bounds.size
        graphScene.configure()
        
        theView.showsFPS = true
        theView.showsNodeCount = true
        theView.ignoresSiblingOrder = true
        graphScene.scaleMode = .resizeFill
        
        
        theView.presentScene(graphScene)
        



    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

