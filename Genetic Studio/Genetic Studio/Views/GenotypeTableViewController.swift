//
//  GenotypeTableViewController.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/31/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class GenotypeTableViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    
    var population: Population!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
        setData(thePop: makeRandomPopulation() )
    }
    
    func setData( thePop: Population ) {
        
        let keys = thePop.getIdentifiers()
        let N = keys.count
        
        //remove table columns
        while tableView.tableColumns.count > 0 {
            tableView.removeTableColumn(tableView.tableColumns.first!)
        }
        
        // add new sets of columns
        for i in 0..<N {
            let key = keys[i]
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: key) )
            column.headerCell = NSTableHeaderCell(textCell: key)
            column.headerCell.title = key
            tableView.addTableColumn(column)
        }
        
        population = thePop
        tableView.reloadData()
        
    }
    
    
    
}


// MARK: Delegate & DataSource
extension GenotypeTableViewController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return population?.individuals.count ?? 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if let id = tableColumn?.identifier {
            let value = population?.getData(key: id.rawValue, row: row)
            let view = NSTextField(labelWithString: value!)
            view.isEditable = false
            view.isBordered = false
            view.backgroundColor = .clear
            return view
        }
        return nil
    }

}



