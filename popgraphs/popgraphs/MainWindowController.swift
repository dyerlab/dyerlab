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
    
    var splitviewVC: SplitViewController?
    var sidebarVC: SidebarViewController?
    
    var popgraphVC: PopgraphViewController?
    var mapviewVC: MapviewViewController?
    
    var theGraph: Graph?
    
    override func windowDidLoad() {
        super.windowDidLoad()
    
        //sssswindowFrameAutosaveName = "PopgraphsMainWindowAutosaveName"
        print("Window is \(window?.frame.size ?? CGSize(width: 0, height:0) )" )
        
        
        
        
        
        sidebarVC = (contentViewController?.children.filter {$0 is SidebarViewController})!.first as? SidebarViewController
        
        // Load in other VC's from Storyboards
        let sb = NSStoryboard(name: "Main", bundle: nil)
        
        
        
        //popgraphVC = sb.instantiateController(withIdentifier: "popgraphViewController") as? PopgraphViewController
        popgraphVC = (contentViewController?.children.filter {$0 is PopgraphViewController})!.first as? PopgraphViewController
        mapviewVC = sb.instantiateController(withIdentifier: "mapviewViewController") as? MapviewViewController
        
        splitviewVC = self.contentViewController as? SplitViewController
        
        
        //popgraphVC = (contentViewController?.children.filter {$0 is PopgraphViewController})!.first as? PopgraphViewController
        
        
        
//        if let titlebarController =
//            self.storyboard?.instantiateController( withIdentifier: NSStoryboard.SceneIdentifier("titlebarViewController") ) as? NSTitlebarAccessoryViewController
//        {
//            // position of title bar
//            titlebarController.layoutAttribute = .right
//
//            // set the titleBar
//            self.window?.addTitlebarAccessoryViewController(
//                titlebarController
//            )
//        }
        
        
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
    
    
    @IBAction func SwitchToGraphView( sender: Any? ) {
        print("toGraphView")
//        splitviewVC?.removeSplitViewItem((splitviewVC?.splitViewItems.last)!)
//        splitviewVC?.addSplitViewItem(NSSplitViewItem(viewController: popgraphVC!))
//        splitviewVC?.splitViewItems.last?.holdingPriority = .defaultHigh
        
        if splitviewVC?.splitViewItems[1].viewController is MapviewViewController {
            splitviewVC?.splitViewItems[1] = NSSplitViewItem(viewController: popgraphVC!)
        } else {
            print("currently graph view, not switching to self")
        }
    }
    
    @IBAction func SwitchToMapView( sender: Any? ) {
        print("toMapView")
//        splitviewVC?.removeSplitViewItem((splitviewVC?.splitViewItems.last)!)
//        splitviewVC?.addSplitViewItem(NSSplitViewItem(viewController: mapviewVC!))
//        splitviewVC?.splitViewItems.last?.holdingPriority = .defaultLow
        if splitviewVC?.splitViewItems[1].viewController is PopgraphViewController {
            splitviewVC?.splitViewItems[1] = NSSplitViewItem(viewController: mapviewVC!)
        } else {
            print("currently map view, not switching to self")
        }

    }
}





