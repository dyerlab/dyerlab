//
//  MainWindowController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/12/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var splitView: NSSplitView!
    
    
    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "MainWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

//        if let loadedNavButtons: NavigationButtonsView = NSView.loadFromNib(nibName: "NavigationButtonsView", owner: self) as? NavigationButtonsView {
//            // Do whatever you want with loadedNavButtons
//        }
        
        
    }
    
    @IBAction func importData( sender: AnyObject? ) {
        print("importData being called")
    }
  
}
