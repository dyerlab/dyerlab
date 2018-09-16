//
//  SpeciesVC.swift
//  taxa
//
//  Created by Rodney Dyer on 2/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import UIKit


class SpeciesVC: UIViewController {
    var taxa: String = "UNDEFINED"
    
    @IBOutlet weak var speciesLabel : UILabel!
    
    override func viewDidLoad() {
        speciesLabel.text = taxa
    }
}
