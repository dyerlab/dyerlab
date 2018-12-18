//
//  ViewController.swift
//  geno
//
//  Created by Rodney Dyer on 11/22/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView: NSTableView!
    var population: Population? 
    var document: Document? {
        return view.window?.windowController?.document as? Document
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
}


// MARK: Table Delegate & Data Source

extension ViewController : NSTableViewDelegate {
    
    
}

extension ViewController : NSTableViewDataSource {
    
//    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
//        let key = tableColumn?.identifier.rawValue
//        return population?.individuals[0].valueForKey( key: key! )
//    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        guard let rows = population?.individuals.count else { return 0}
        
        return rows
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let id = tableColumn?.identifier {
            let value = population?.individuals[row].valueForKey(key: id.rawValue)
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
    
    public func addPopulation(_ thePop: Population ) {
        if thePop.individuals.count < 1 {
            return
        }

        self.population = thePop
        
        // remove all the columns
        while tableView.tableColumns.count > 0 {
            tableView.removeTableColumn( tableView.tableColumns.last! )
        }
        
        // make new ones
        for key in self.population!.allKeys() {
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
    
    
}
