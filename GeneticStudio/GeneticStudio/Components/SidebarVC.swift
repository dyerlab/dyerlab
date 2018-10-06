//
//  SidebarViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 9/27/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa


class SidebarVC : NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    
    let tableViewData = ["Data","Diversity","Structure","Distance","PopGraph"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print( "SidebarVC::viewDidLoad()" )
        
        
        // Set up the table view
        self.tableView.layer?.backgroundColor = CGColor.clear   
        self.tableView.delegate = self as NSTableViewDelegate
        self.tableView.dataSource = self

        
        
        
    }
    
}


extension SidebarVC : NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let val = self.tableViewData[row]
        print("Sending: \(val)")
        return val
    }
    
}


extension SidebarVC : NSTableViewDelegate {
    

}
