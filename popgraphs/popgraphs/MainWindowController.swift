//
//  MainWindowController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa



class MainWindowController: NSWindowController {
    
    static let loadNewGraphNotification = Notification.Name("loadNewGraphNotificationName")
    var popgraphVC: PopgraphViewController?
    var sidebarVC: SidebarViewController?
    
    var theGraph: Graph?
    
    var toolbar: NSToolbar!
    
    let toolbarItems: [[String: String]] = [
                        ["title": "irrelevant :)",
                         "icon": "",
                         "identifier": "NavigationGroupToolbarItem"]
                        ]
    

    override func windowDidLoad() {
        super.windowDidLoad()
    
        //sssswindowFrameAutosaveName = "PopgraphsMainWindowAutosaveName"
        print("Window is \(window?.frame.size ?? CGSize(width: 0, height:0) )" )
        
        popgraphVC = (contentViewController?.children.filter {$0 is PopgraphViewController})!.first as? PopgraphViewController
        sidebarVC = (contentViewController?.children.filter {$0 is SidebarViewController})!.first as? SidebarViewController
        
        
        // make the toolbar
        
        
    }

    @IBAction func OnImportFile(sender: Any?) {
        theGraph = Graph()
        theGraph!.makeNode(radius: 25, label: "Bob")
        theGraph!.makeNode(radius: 12, label: "Alice")
        theGraph!.makeNode(radius: 18, label: "Darius")
        theGraph!.makeEdge(label1: "Bob", label2: "Alice", weight: 1.0)
        theGraph!.makeEdge(label1: "Bob", label2: "Darius", weight: 2.0)
        theGraph!.makeEdge(label1: "Darius", label2: "Alice", weight: 2.8)

        popgraphVC!.theScene?.setGraph( graph: theGraph! )
        sidebarVC!.setGraph( graph: theGraph! )

    }
    
    
}





extension MainWindowController : NSToolbarDelegate {
   
    
    
}
