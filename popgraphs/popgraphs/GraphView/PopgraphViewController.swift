//
//  GraphViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit


class PopgraphViewController: NSViewController {
    
    var theScene: GraphScene?
    @IBOutlet var popgraphView: PopgraphView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        theScene = GraphScene(size: self.popgraphView.bounds.size )
        popgraphView.skView.presentScene(theScene)
        
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(loadNewDataNotification(notification:)),
                                               name: MainWindowController.loadNewGraphNotification,
                                               object: nil)
        
        print("popgraphVC:viewDidLoad")
    }

    
    @objc func loadNewDataNotification( notification: Notification ) {
        print("PopgraphViewController::loadNewDataNotification()")
        print( notification.userInfo! )
    }
    
    
    func doIt() {
        print("doing it")
    }
    
}







// MARK: Visual toggles of stuff
extension PopgraphViewController {
    
   

    
    
}

