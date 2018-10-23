//
//  TabViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class TabViewController: NSTabViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        // Register for notifications
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(OnDidRequestDataSegue(_:)),
                                               name: .showGenotypeView,
                                               object: nil )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(OnDidRequestDataSegue(_:)),
                                               name: .showDiversityView,
                                               object: nil )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(OnDidRequestDataSegue(_:)),
                                               name: .showStructureView,
                                               object: nil )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(OnDidRequestDataSegue(_:)),
                                               name: .showDistanceView,
                                               object: nil )
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(OnDidRequestDataSegue(_:)),
                                               name: .showPopGraphView,
                                               object: nil )
        
        
    }
    

    @objc func OnDidRequestDataSegue(_ notification: Notification ) {
        print("Received Notification: \(notification.description))")
        
        if notification.name == .showGenotypeView {
            self.selectedTabViewItemIndex = 0
        }
        else if notification.name == .showDiversityView {
            self.selectedTabViewItemIndex = 1
        }
        else if notification.name == .showStructureView {
            self.selectedTabViewItemIndex = 2
        }
        else if notification.name == .showDistanceView {
            self.selectedTabViewItemIndex = 3
        }
        else if notification.name == .showPopGraphView {
            self.selectedTabViewItemIndex = 4
        }
        else {
            print("don't have that many tabs yet.")
        }
    }


}
