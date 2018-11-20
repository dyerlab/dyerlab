//
//  MainWindowSplitViewController.swift
//  DLab
//
//  Created by Rodney Dyer on 10/23/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowSplitViewController: NSSplitViewController {
    
    var sideView: NSView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        //print("MWSpltViewController::viewDidLoad")
        
        
        // load in the sideview
//        sideView = NSView.loadFromNib(nibName: "SidebarViewController", owner: self) as? NSOutlineView
//        if sideView != nil  {
//            self.splitView.addSubview(sideView)
//        }
//        
        
    }
    
}


