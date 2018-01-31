//  TableViewFromCodeWindowController.swift
//  SwiftTableViews
//  Created by Debasis Das on 25/01/16.
//  Copyright © 2016 Knowstack. All rights reserved.

import Cocoa

class TableViewFromCodeWindowController: NSWindowController,NSTableViewDataSource, NSTableViewDelegate {

    let columnDefaultWidth:Float = 100.0
    
    //List of Table Columns Metadata that will be used to create the tableview programatically
    let tableViewColumnNamesArray: NSArray = [
        ["columnIdentifier":"firstName","columnTitle":"First Name","columnType":"text","columnMaxWidth":500,"columnMinWidth":50],
        ["columnIdentifier":"lastName","columnTitle":"Last Name","columnType":"text","columnMaxWidth":500,"columnMinWidth":50],
        ["columnIdentifier":"age","columnTitle":"Age","columnType":"text","columnMaxWidth":500,"columnMinWidth":50],
        ["columnIdentifier":"salary","columnTitle":"Salary","columnType":"text","columnMaxWidth":500,"columnMinWidth":50],
        ["columnIdentifier":"fullTimeEmployee","columnTitle":"Full Time Employee","columnType":"check","columnMaxWidth":500,"columnMinWidth":50]
    ]
    
    var dataArray:NSMutableArray = []
    
    @IBOutlet weak var tableView: NSTableView?
    
    override func windowDidLoad() {
        
        super.windowDidLoad()
        
        self.dataArray = NSMutableArray(array: self.createTestData())
        
        self.tableView?.setDataSource(self)
        
        self.tableView?.setDelegate(self)

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override func awakeFromNib() {

        self.removeAllTableColumn()
        
        for var columnDictionary  in self.tableViewColumnNamesArray {
            let tColumn:NSTableColumn = NSTableColumn(identifier: columnDictionary["columnIdentifier"]! as! String)
            tColumn.headerCell.title = columnDictionary["columnTitle"]! as! String
            //Float to CGfloat conversion is required
            tColumn.width = CGFloat(columnDefaultWidth)
            tColumn.minWidth = CGFloat(columnDictionary["columnMinWidth"]! as! Float)
            tColumn.maxWidth = CGFloat(columnDictionary["columnMaxWidth"]! as! Float)
            
           if (columnDictionary["columnType"] as! String == "check"){
                let checkBox = NSButtonCell()
                checkBox.setButtonType(.SwitchButton)
                checkBox.title = ""
                checkBox.alignment = .Right
                tColumn.dataCell = checkBox
                
                
            }
            //else use the default text field cell
            //Applying sort descriptors to each column
            let sortDescriptor = NSSortDescriptor( key: columnDictionary["columnIdentifier"]! as? String, ascending: true, selector: Selector("compare:"))
        
            tColumn.sortDescriptorPrototype = sortDescriptor

            self.tableView?.addTableColumn(tColumn)

        }

        self.tableView?.usesAlternatingRowBackgroundColors = true
    
        self.tableView?.columnAutoresizingStyle = .UniformColumnAutoresizingStyle
        
    }
    
     func removeAllTableColumn()
    {
        let tColCount = self.tableView!.tableColumns.count
        
        if tColCount > 0
        {
            for var i = 0; i < tColCount; i++
            {
     
                self.tableView!.removeTableColumn((self.tableView?.tableColumns[0])!)
            }
        }
    }
    //Demo data is created here
    func createTestData() -> NSArray
    {
        return [
                ["firstName":"Debasis","lastName":"Das","age":"26","salary":"10000","fullTimeEmployee":1],
                ["firstName":"John","lastName":"Doe","age":"26","salary":"10000","fullTimeEmployee":1],
                ["firstName":"Jane","lastName":"Doe","age":"26","salary":"10000","fullTimeEmployee":0]
        ]
    }

    func numberOfRowsInTableView(aTableView: NSTableView!) -> Int
    {
        let numberOfRows:Int = self.dataArray.count
        
        return numberOfRows
    }
    
    func tableView(tableView: NSTableView!, objectValueForTableColumn tableColumn: NSTableColumn!, row: Int) -> AnyObject!
    {
        let object = self.dataArray[row]
        
        return object[tableColumn.identifier]
    }

    func tableView(tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor])
    {
        self.dataArray.sortUsingDescriptors(tableView.sortDescriptors)
    
        self.tableView?.reloadData()
    }
}
