//
//  MainWindowController.swift
//  DLab
//
//  Created by Rodney Dyer on 10/23/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        self.windowFrameAutosaveName = "DLabWindowPosition"
    }

}
