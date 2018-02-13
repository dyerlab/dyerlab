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

    var dataOutlineVC: DataOutlineViewController?
    
    
    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "MainWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        if let outlineView: NSOutlineView = NSView.loadFromNib(nibName: "DataOutlineViewController", owner: self) as? NSOutlineView {
            self.dataOutlineVC = DataOutlineViewController()
            self.dataOutlineVC?.outlineView = outlineView
        }
//        if let loadedNavButtons: NavigationButtonsView = NSView.loadFromNib(nibName: "NavigationButtonsView", owner: self) as? NavigationButtonsView {
//            // Do whatever you want with loadedNavButtons
//        }
        
        
    }
  
}
