//
//  GenotypeTableViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

class GenotypeTableViewController : NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("GenotypeTableViewController::viewDidLoad()")
    }
}
