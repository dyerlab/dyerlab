//
//  GraphViewController.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    var document: Document? {
        get {
            return view.window?.windowController?.document as? Document
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
