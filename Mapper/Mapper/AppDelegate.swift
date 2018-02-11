//
//  AppDelegate.swift
//  Mapper
//
//  Created by Rodney Dyer on 2/10/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        let mainWindowController = MainWindowController()
        mainWindowController.showWindow( self )
        self.mainWindowController = mainWindowController
        print("AppDelegate::applicationDifFinishLaunching")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

