//
//  SidebarViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/5/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {
    
    var theGraph: Graph?
    var categories: [OutlineCategory] = []
    
    
    @IBOutlet var sidebarView: SidebarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("SidebarVC::viewDidLoad()")
    }
    
    
    
    
}



extension SidebarViewController {
    
    public func setGraph( graph: Graph ) {
        
        theGraph = graph
        categories.removeAll()
        
        let popgraphCategory = OutlineCategory(name: "Population Graph")
        
        let nodeSet = OutlineSet(name: "Nodes")
        for node in graph.nodes {
            let entry = OutlineItem(title: node.name! )
            nodeSet.children.append(entry)
        }
        popgraphCategory.children.append( nodeSet )
        
        let edgeSet = OutlineSet(name: "Edges")
        for edge in graph.edges {
            let entry = OutlineItem(title: String("\(edge.node1.name!) - \(edge.node2.name!))") )
            edgeSet.children.append( entry )
        }
        popgraphCategory.children.append( edgeSet )
        
        print("Loaded Graph in SidebarVC")
        print( "\(popgraphCategory)")
        
        categories.append( popgraphCategory )
        
        if let ov = sidebarView.outlineView {
            ov.delegate = self
            ov.dataSource = self
            ov.reloadData()
        }
    }
    
}




extension SidebarViewController : NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        
        // grab something that exists as a subunit
        if let item: Any = item {
            switch item {
                
            case let outlineCat as OutlineCategory:
                return outlineCat.children[index]
            case let outlineSet as OutlineSet:
                return outlineSet.children[index]
            default:
                return self
            }
        }
        
        // return as top-level unit
        else {
            return self.categories[index]
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        
        switch item {
            
        case let outlineCat as OutlineCategory:
            return outlineCat.children.count > 0
            
        case let outlineSet as OutlineSet:
            return outlineSet.children.count > 0
            
        default:
            return false
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item: Any = item {
            
            switch item {
            case let outlineCat as OutlineCategory:
                return outlineCat.children.count
                
            case let outlineSet as OutlineSet:
                return outlineSet.children.count
                
            default:
                return 0
            }
        }
        else {
            return self.categories.count
        }
    }
    
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        switch item {
            
        case let outlineCat as OutlineCategory:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("HeaderCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = outlineCat.name
            }
            return view
            
        case let outlineSet as OutlineSet:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("DataCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = outlineSet.name
            }
            return view
         
        case let outlineItem as OutlineItem:
            let view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("DataCell"), owner: self) as! NSTableCellView
            if let textField = view.textField {
                textField.stringValue = outlineItem.title
            }
            return view
            
        default:
            return nil
        }
    }

    
    func outlineView(_ outlineView: NSOutlineView, isGroupItem item: Any) -> Bool {
        switch item {
            
        case _ as OutlineCategory:
            return true
            
        default:
            return false
        }
    }
    
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        print("Selection Chagned in Outline View")
        print(notification)
        
        
    }
    
    
}
