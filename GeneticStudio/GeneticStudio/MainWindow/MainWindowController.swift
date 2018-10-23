//
//  MainWindowController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 9/27/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

class MainWindowController:  NSWindowController {
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        print("MainWindowController::windowDidLoad()")
        
        self.windowFrameAutosaveName = "GStudioWindowPosition"
    }
    
}
