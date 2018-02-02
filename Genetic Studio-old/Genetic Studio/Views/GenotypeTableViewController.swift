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
            let column : NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: key))
            column.headerCell.title = key
            tableView.addTableColumn(column)
        }
        
        
        //    let tColumn:NSTableColumn = NSTableColumn(identifier: columnDictionary["columnIdentifier"]! as! String)
        //    tColumn.headerCell.title = columnDictionary["columnTitle"]! as! String
        //    //Float to CGfloat conversion is required
        //    tColumn.width = CGFloat(columnDefaultWidth)
        //    tColumn.minWidth = CGFloat(columnDictionary["columnMinWidth"]! as! Float)
        //    tColumn.maxWidth = CGFloat(columnDictionary["columnMaxWidth"]! as! Float)
        //
        //    if (columnDictionary["columnType"] as! String == "check"){
        //    let checkBox = NSButtonCell()
        //    checkBox.setButtonType(.SwitchButton)
        //    checkBox.title = ""
        //    checkBox.alignment = .Right
        //    tColumn.dataCell = checkBox
        //
        //
        //    }
        //    //else use the default text field cell
        //    //Applying sort descriptors to each column
        //    let sortDescriptor = NSSortDescriptor( key: columnDictionary["columnIdentifier"]! as? String, ascending: true, selector: Selector("compare:"))
        //
        //    tColumn.sortDescriptorPrototype = sortDescriptor
        //
        //    self.tableView?.addTableColumn(tColumn)

        
        
        
        
    }
    
}



extension GenotypeTableViewController: NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return population?.individuals.count ?? 0
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        print("Hello")
        if let key = tableColumn?.headerCell.title {
            print("key is: \(key)")
            return(key)
        }
        else {
            return "Bob"
        }
    }
    
}


extension GenotypeTableViewController: NSTableViewDelegate {
    
    
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        if let key = tableColumn?.headerCell.title {
//            let identifier = NSUserInterfaceItemIdentifier(rawValue: key)
//            let view = tableView.makeView(withIdentifier: identifier, owner: self) as! NSTableCellView
//            let value = population.getData(key: key, row: row)
//            view.textField?.stringValue = value
//            return view
//        }
//        else {
//            return nil
//        }
//    }
//
//    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//
//        if let columnID = tableColumn?.identifier {
//            print("in colID")
//            let view = tableView.makeView(withIdentifier: columnID , owner: self ) as? NSTableCellView
//            let key = columnID.rawValue
//            let text = population.getData(key: key, row: row)
//            print("got \(text) for \(key)")
//            view?.textField?.stringValue = text
//            return view
//        }
//        else {
//            print("bailing")
//            return nil
//        }
////        let id = tableColumn!.identifier
////        print("Asking for id: \(id.rawValue)")
////
////        guard let vw = tableView.makeView(withIdentifier: id, owner: self) as? NSTableCellView else { print("bailing"); return nil }
////
////        let key = id.rawValue
////        print("Asking for column \(key)")
////        vw.textField?.stringValue = population.getData(key: key, row: row)
//
//
//        //vw.textField?.stringValue = "Hello, world!"
//
//        //return vw
//    }
    
}


