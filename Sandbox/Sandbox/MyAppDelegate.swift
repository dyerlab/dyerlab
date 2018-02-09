//
//  AppDelegate.swift
//  Sandbox
//
//  Created by Rodney Dyer on 2/7/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import Foundation

@NSApplicationMain
class MyAppDelegate: NSObject, NSApplicationDelegate {
    
    public var importFilePath: String = String() {
        didSet {
            NotificationCenter.default.post(name: .loadVNCFileNotifiation, object: nil)
            print("Sending 'Load VNC' notification")
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func ImportVNC(_ sender: Any) {
        print("importedVNCAction baby!")
        let openDialog = NSOpenPanel()
        openDialog.canChooseDirectories = false
        openDialog.canChooseFiles = true
//        openDialog.allowedFileTypes = ["vnc"]
        openDialog.allowsMultipleSelection = false
        openDialog.title = "Select VNC File"
        if openDialog.runModal() == NSApplication.ModalResponse.OK {
            self.importFilePath = openDialog.url!.path
        } else {
            print("canceled")
        }
    }
    
//https://forums.developer.apple.com/thread/27471


}

