////
////  OutlineViewController.swift
////  popgraphs
////
////  Created by Rodney Dyer on 1/4/19.
////  Copyright © 2019 Rodney Dyer. All rights reserved.
////
//
//import Cocoa
//
//class OutlineViewController: NSViewController {
//
//    @IBOutlet weak var outlineView: NSOutlineView!
//    
//    var categories: [OutlineCategory] = []
//    var graph: Graph?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//    
//    func setGraph( graph: Graph ) {
//        categories.removeAll()
//        
//        // set up summary category
//        let summaryCat = OutlineCategory(name: "Summary" )
//        summaryCat.children.append( OutlineItem( title: "# Nodes: \(graph.nodes.count)") )
//        summaryCat.children.append( OutlineItem( title: "# Edges: \(graph.edges.count)") )
//        
//        // set up nodes category
//        let nodesCat = OutlineCategory(name: "Nodes")
//        for node in graph.nodes {
//            let itm = OutlineItem(title: node.name! )
//            itm.properties["Size"] = String("\(node.size.width)")
//            itm.properties["Degree"] = String("\(node.degree)")
//            nodesCat.children.append( itm )
//        }
//        
//        // set up edges category
//        let edgesCat = OutlineCategory( name: "Edges" )
//        for edge in graph.edges {
//            let itm = OutlineItem(title: String("\(edge.node1.name!) - \(edge.node2.name!)") )
//            itm.properties["Weight"] = String("\(edge.lineNode.lineWidth)")
//        }
//        
//        // Append them all to the outline view
//        self.categories.append(summaryCat)
//        self.categories.append(nodesCat)
//        self.categories.append(edgesCat)
//        
//        self.graph = graph
//        print("setGraph")
//    }
//    
//}
//
//
//// MARK: Delegate Roles
//extension OutlineViewController : NSOutlineViewDelegate {
//
//    
//    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
//        var view: NSTableCellView?
//        
//        if let entry = item as? OutlineCategory {
//            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "CategoryCell"), owner: self) as? NSTableCellView
//            if let textField = view?.textField {
//                textField.stringValue = entry.name
//                textField.sizeToFit()
//            }
//        }
//        
//        return view
//    }
//}
//
//// MARK: Data Source Items
//extension OutlineViewController : NSOutlineViewDataSource {
//    
//    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
//        print("numberofchildrenofitem")
//        if let entry = item as? OutlineCategory {
//            return entry.children.count
//        }
//        else {
//            return categories.count
//        }
//        
//    }
//    
//    
//    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
//        if let entry = item as? OutlineCategory {
//            return entry.children[index]
//        }
//        else {
//            return categories[index]
//        }
//    }
//    
//    
//    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
//        if let entry = item as? OutlineCategory {
//            return entry.children.count > 0
//        }
//        else {
//            return false
//        }
//    }
//}
