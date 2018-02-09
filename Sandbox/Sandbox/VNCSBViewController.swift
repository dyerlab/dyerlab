//
//  VNCSBViewController.swift
//  Sandbox
//
//  Created by Rodney Dyer on 2/7/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

class VNCSBViewController: NSViewController {

    @IBOutlet weak var vncTableView: NSTableView!
    
    let delegate = NSApplication.shared.delegate! as NSApplicationDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        
        print("VNCSBViewController in EFFECT 'yal")
    }
    

}
