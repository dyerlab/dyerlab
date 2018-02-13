//
//  AppDelegate.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 2/12/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let windowController = MainWindowController()
        windowController.showWindow(self)
        self.mainWindowController = windowController
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

