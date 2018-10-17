//
//  SidebarViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 9/27/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa


enum SideBarSelection :Int {
    case Data = 0
    case Diversity
    case Structure
    case Distance
    case PopGraph
    case Undefined
}

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


extension SidebarVC : NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.tableViewData.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView?{
        var result:NSTableCellView
        
        result  = tableView.makeView( withIdentifier: (tableColumn?.identifier)!, owner: self) as! NSTableCellView
        result.textField?.stringValue = tableViewData[row]
        return result
    }
    
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        
        switch row {
        case 0:
            NotificationCenter.default.post(name: .showGenotypeView, object: nil)
            break
        case 1:
            NotificationCenter.default.post(name: .showDiversityView, object: nil)
            break
        case 2:
            NotificationCenter.default.post(name: .showStructureView, object: nil)
            break
        case 3:
            NotificationCenter.default.post(name: .showDistanceView, object: nil)
            break
        case 4:
            NotificationCenter.default.post(name: .showPopGraphView, object: nil)
            break
        default:
            break
        }
        
        return true
    }
    
}
