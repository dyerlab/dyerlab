//
//  SidebarViewController.swift
//  DLab
//
//  Created by Rodney Dyer on 11/12/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class SidebarViewController: NSViewController {
    
    @IBOutlet weak var outlineView: NSOutlineView!
    
    let items = ["Data",
                 "Maps",
                 "PopGraph",
                 "Diversity",
                 "Structure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("in SidebarViewController::viewDidLoad()")
        outlineView.delegate = self
        outlineView.dataSource = self
        
    }
    
}


extension SidebarViewController: NSOutlineViewDataSource {
    
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        print("has \(items.count) items")
        return items.count
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        print("asking for \(items[index])")
        return items[index]
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool {
        return false
    }
    
    func outlineViewSelectionDidChange(_ notification: Notification) {
        let row = outlineView.selectedRow
        
        switch row {
        case 0:
            NotificationCenter.default.post(name: .switchToDataPage, object: nil)
            break
        case 1:
            NotificationCenter.default.post(name: .switchToMapPage, object: nil)
            break
        case 2:
            NotificationCenter.default.post(name: .switchToPopgraphPage, object: nil)
            break
        case 3:
            NotificationCenter.default.post(name: .switchToDiversityPage, object: nil)
            break
        case 4:
            NotificationCenter.default.post(name: .switchToStructurePage, object: nil)
            break
        default:
            break
        }

    }
    
    func outlineView(_ outlineView: NSOutlineView, heightOfRowByItem item: Any) -> CGFloat {
        return 40.0
    }
    
//    @objc func windowLostFocus(_ notification: Notification) {
//        setRowColour(outlineView, false)
//    }
//
//    @objc func windowGainedFocus(_ notification: Notification) {
//        setRowColour(outlineView, true)
//    }
//
//    func setRowColour(_ outlineView: NSOutlineView, _ windowFocused: Bool) {
//        let rows = IndexSet(integersIn: 0..<outlineView.numberOfRows)
//        let rowViews = rows.compactMap { outlineView.rowView(atRow: $0, makeIfNecessary: false) }
//        var initialLoad = true
//
//        // Iterate over each row in the outlineView
//        for rowView in rowViews {
//            if rowView.isSelected {
//                initialLoad = false
//            }
//
//            if windowFocused && rowView.isSelected {
//                rowView.backgroundColor = .green
//            } else if rowView.isSelected {
//                rowView.backgroundColor = .brown
//            } else {
//                rowView.backgroundColor = .clear
//            }
//        }
//
//        if initialLoad {
//            self.setInitialRowColour()
//        }
//    }
    
//    func setInitialRowColour() {
//        outlineView.rowView(atRow: 0, makeIfNecessary: true)?.backgroundColor = NSColor(red: 0.99, green: 0.88, blue: 0.55, alpha: 1)
//    }
//
//    // Remove default selection colour
//    func outlineView(_ outlineView: NSOutlineView, didAdd rowView: NSTableRowView, forRow row: Int) {
//        rowView.selectionHighlightStyle = .none
//    }

    
}


extension SidebarViewController : NSOutlineViewDelegate {
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        
        if let title = item as? String {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "DataCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {
                textField.stringValue = title
                textField.sizeToFit()
            }
            if let imageView = view?.imageView {
                //imageView.image = NSWorkspace.shared.icon(forFileType: "docx")
                //imageView.image = NSImage(named: NSImage.listViewTemplateName)
                imageView.image = nil
            }
        }
        
        return view
    }
    
}

