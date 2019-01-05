//
//  MainWindowController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
//    var graphController: MainViewController? {
//        get {
//            return NSApplication.shared.keyWindow!.contentViewController?.children.filter {$0 is MainViewController}.first as? MainViewController
//        }
//    }
//    var summaryViewController: SideBarController? {
//        get {
//            return NSApplication.shared.keyWindow!.contentViewController?.children.filter {$0 is SideBarController}.last as? SideBarController
//        }
//    }
//    

    override func windowDidLoad() {
        super.windowDidLoad()
    
        //sssswindowFrameAutosaveName = "PopgraphsMainWindowAutosaveName"
        print("Window is \(window?.frame.size ?? CGSize(width: 0, height:0) )" )
    }

    @IBAction func OnImportFile(sender: Any?) {
        print("OnImportFile()")
        
        let currentGraph = Graph()
        currentGraph.makeNode(radius: 25, label: "Bob")
        currentGraph.makeNode(radius: 12, label: "Alice")
        currentGraph.makeNode(radius: 18, label: "Darius")
        currentGraph.makeEdge(label1: "Bob", label2: "Alice", weight: 1.0)
        currentGraph.makeEdge(label1: "Bob", label2: "Darius", weight: 2.0)
        currentGraph.makeEdge(label1: "Darius", label2: "Alice", weight: 2.8)
        
//        
//        if let ctrl = self.graphController {
//            currentGraph.nodes.forEach {$0.randomizeLocation(width: ctrl.scene!.size.width, height: ctrl.scene!.size.height) }
//            ctrl.scene!.addGraph( graph: currentGraph )
//        }
//        else {
//            print("Cannot instantiate main content controller")
//        }
//        
//        if let ctrl = self.summaryViewController {
//            ctrl.setGraph( graph: currentGraph )
//        }
//        else {
//            print("Cannot instantiate summary view controller")
//        }
    }
    
    
}
