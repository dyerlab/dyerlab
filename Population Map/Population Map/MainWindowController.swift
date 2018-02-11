//
//  MainWindowController.swift
//  Population Map
//
//  Created by Rodney Dyer on 2/10/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override var windowNibName: NSNib.Name? {
        return NSNib.Name(rawValue: "MainWindowController")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()

        print("mainwindowcontroller::windowdidload()")
    }
    
}
