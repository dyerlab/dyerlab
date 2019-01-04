//
//  SplitViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class SplitViewController: NSSplitViewController {
    
    var currentGraph: Graph?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        currentGraph = Graph()
        currentGraph!.makeNode(radius: 25, label: "Bob")
        currentGraph!.makeNode(radius: 12, label: "Alice")
        currentGraph!.makeNode(radius: 18, label: "Darius")
        currentGraph!.makeEdge(label1: "Bob", label2: "Alice", weight: 1.0)
        currentGraph!.makeEdge(label1: "Bob", label2: "Darius", weight: 2.0)
        currentGraph!.makeEdge(label1: "Darius", label2: "Alice", weight: 2.8)

        print("SVC: vDL()")
    }
    
}
