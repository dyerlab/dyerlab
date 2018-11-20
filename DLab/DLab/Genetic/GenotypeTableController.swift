//
//  GenotypeTableController.swift
//  DLab
//
//  Created by Rodney Dyer on 11/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class GenotypeTableController: NSViewController {
    
    var population: Population?
    
    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GenotypeTableController::viewDidLoad()")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.addPopulation( loadArapat() )
        
        tableView.layer?.backgroundColor = CGColor.clear
        tableView.enclosingScrollView!.layer?.backgroundColor = CGColor.clear
        tableView.enclosingScrollView!.borderType = .noBorder
        tableView.enclosingScrollView!.drawsBackground = false
        
    }
    
    
}



// MARK: Data Source routines

extension GenotypeTableController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, shouldEdit tableColumn: NSTableColumn?, row: Int) -> Bool {
        return true
    }
}


extension GenotypeTableController: NSTableViewDataSource {
    
    public func addPopulation(_ thePop: Population ) {
        self.population = thePop
        
        // remove all the columns
        while tableView.tableColumns.count > 0 {
            tableView.removeTableColumn( tableView.tableColumns.last! )
        }
        
        // make new ones
        for key in self.population!.keys {
            let id = NSUserInterfaceItemIdentifier(key)
            let tableColumn = NSTableColumn(identifier: id )
            tableColumn.headerCell = NSTableHeaderCell(textCell: key)
            tableColumn.headerCell.title = key
            tableColumn.headerCell.alignment = NSTextAlignment.center
            tableColumn.headerCell.backgroundColor = NSColor.clear
            
            tableView.addTableColumn( tableColumn )
        }
        tableView.reloadData()
    }

    
    func numberOfRows(in tableView: NSTableView) -> Int {
        let r = self.population?.count
        print("now there are: \(r ?? 0) data rows")
        return r ?? 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let id = tableColumn?.identifier {
            let value = population?.data(key: id.rawValue, row: row)
            let view = NSTextField(labelWithString: value!)
            view.isBezeled = false
            view.isEditable = true
            view.isBordered = false
            view.drawsBackground = false
            //view.backgroundColor = NSColor.white
            //view.backgroundColor = NSColor.windowBackgroundColor
            view.alignment = NSTextAlignment.center
            return view
        }
        return nil
    }
}
