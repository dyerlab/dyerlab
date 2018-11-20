//
//  TabViewController.swift
//  DLab
//
//  Created by Rodney Dyer on 11/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class TabViewController: NSTabViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePane),
                                               name: Notification.Name.switchToDataPage,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePane),
                                               name: Notification.Name.switchToStructurePage,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePane),
                                               name: Notification.Name.switchToDiversityPage,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changePane),
                                               name: Notification.Name.switchToPopgraphPage,
                                               object: nil)
    }
    
    @objc func changePane(_ notification: Notification) {
        let pane = notification.name.rawValue
        

            switch pane {
                
            case "switchToDataPage":
                tabView.selectTabViewItem(at: 0)
                break
            case "switchToDiversityPage":
                tabView.selectTabViewItem(at: 1)
                break
            case "switchToStructurePage":
                tabView.selectTabViewItem(at: 2)
                break
            case "switchToPopgraphPage":
                tabView.selectTabViewItem(at: 3)
                break
                
            case "switchToMapPage":
                tabView.selectTabViewItem(at: 4)
                break
                
            default:
                break
                
            }
            
        
        print("changePane triggered to: \(notification.name.rawValue)")
        
    }
    
}
