//
//  SidebarViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 9/27/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa


class SidebarViewController : NSViewController {
    

    @IBOutlet var sideBar: SideBar!
    
    override func viewDidLoad() {
        print( "SidebarViewController::viewDidLoad()" )
        
        sideBar = SideBar.loadFromNib()
        
        super.viewDidLoad()

    }
    
    
}
