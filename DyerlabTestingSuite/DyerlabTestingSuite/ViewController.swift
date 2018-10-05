//
//  ViewController.swift
//  DyerlabTestingSuite
//
//  Created by Rodney Dyer on 9/15/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit
import PopGraphKit

class ViewController: NSViewController {

    @IBOutlet var SceneView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("in vdl")
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

