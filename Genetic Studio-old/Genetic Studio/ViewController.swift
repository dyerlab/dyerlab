//
//  ViewController.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var splitView: NSSplitView!
    
    @IBOutlet weak var tableView: NSTableView!
    
    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("VC::viewDidLoad()")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


    func appendToResults( text: String ) {
        textView.append(string: text )
    }
}

