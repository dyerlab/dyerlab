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
        print("GenotypeTableViewController::viewDidLoad")
        print("Removing columns \(tableView.tableColumns.count)")
        removeAllColumns()
        population = makeRandomPopulation()
        let keys = population?.getIdentifiers()
        print("Adding Columns")
        addNewColumns(keys: keys!)
        print("Removing columns \(tableView.tableColumns.count)")
        tableView.reloadData()
    }
    
    func removeAllColumns() {
        while tableView.tableColumns.count > 0 {
            tableView.removeTableColumn( tableView.tableColumns.last!)
        }
    }
    
    func addNewColumns( keys: Array<String> ) {
        
        for key in keys {
            print("Using identifier: \(key)")
            let ID = NSUserInterfaceItemIdentifier(rawValue: key )
            let column = NSTableColumn(identifier: ID)
            column.headerCell.stringValue = key
            tableView.addTableColumn(column)
        }
    }
    
}



extension GenotypeTableViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return population?.individuals.count ?? 0
    }
    
}


extension GenotypeTableViewController: NSTableViewDelegate {
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let id = tableColumn!.identifier
        print("Asking for id: \(id.rawValue)")
        
        guard let vw = tableView.makeView(withIdentifier: id, owner: self) as? NSTableCellView else { print("bailing"); return nil }
        
        let key = id.rawValue
        print("Asking for column \(key)")
        vw.textField?.stringValue = population.getData(key: key, row: row)
        
        
        //vw.textField?.stringValue = "Hello, world!"
        
        return vw
    }
    
}


