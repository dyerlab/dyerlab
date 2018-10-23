//
//  GenotypeTableVC.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import PopGenKit

class GenotypeTableVC: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    var population: Population?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.gridColor = NSColor.clear
        tableView.enclosingScrollView?.drawsBackground = false
        //tableView.intercellSpacing = NSMakeSize(0, 0)
        
        self.addPopulation(thePop: loadArapat() )
    }
    
    
}



// MARK: Table Extension for Population object

extension GenotypeTableVC: NSTableViewDelegate, NSTableViewDataSource {

    
    public func addPopulation( thePop: Population ) {
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
        return self.population?.count ?? 0
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



