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

        if let path = Bundle.main.path(forResource: "lopho", ofType: "json") {
            print("path: \(path)")
            theGraph = Graph.readFromJSON(path: path)
            popgraphVC!.theScene?.setGraph( graph: theGraph! )
            sidebarVC!.setGraph( graph: theGraph! )
            mapviewVC!.setGraph( graph: theGraph! )
        }
    }
    
    
    @IBAction func SwitchToGraphView( sender: Any? ) {
        print("toGraphView")
        
        if splitviewVC?.splitViewItems[1].viewController is MapviewViewController {
            splitviewVC?.splitViewItems[1] = NSSplitViewItem(viewController: popgraphVC!)
        } else {
            print("currently graph view, not switching to self")
        }
    }
    
    @IBAction func SwitchToMapView( sender: Any? ) {
        print("toMapView")
        if splitviewVC?.splitViewItems[1].viewController is PopgraphViewController {
            splitviewVC?.splitViewItems[1] = NSSplitViewItem(viewController: mapviewVC!)
        } else {
            print("currently map view, not switching to self")
        }

    }
}





