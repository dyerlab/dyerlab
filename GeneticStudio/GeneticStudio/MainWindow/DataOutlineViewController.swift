//
//  DataOutlineViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/12/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class DataOutlineViewController: NSWindowController {

    @IBOutlet weak var outlineView: NSOutlineView!

    
    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "DataOutlineViewController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        
    }
    
}

//extension DataOutlineViewController: NSOutlineViewDelegate {
//    
//}
//
//
//extension DataOutlineViewController: NSOutlineViewDataSource {
//    
//}

