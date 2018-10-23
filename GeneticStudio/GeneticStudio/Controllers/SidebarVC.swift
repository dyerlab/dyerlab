//
//  SidebarViewController.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 9/27/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa


enum SideBarSelection :Int {
    case Data = 0
    case Diversity
    case Structure
    case Distance
    case PopGraph
    case Undefined
}

class SidebarVC : NSViewController {

    
    @IBOutlet weak var dataButton: NSButton!
    @IBOutlet weak var diversityButton: NSButton!
    @IBOutlet weak var distanceButton: NSButton!
    @IBOutlet weak var structureButton: NSButton!
    @IBOutlet weak var popgraphButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print( "SidebarVC::viewDidLoad()" )
        

    }
    
    @IBAction func OnDataClick(_ sender: Any) {
        print("data clicked")
        justToggled(sender as! NSButton)
        NotificationCenter.default.post(name: .showGenotypeView, object: nil)
        
    }
    
    @IBAction func OnDiversityClick(_ sender: Any) {
        print("diversity clicked")
        justToggled(sender as! NSButton)
        NotificationCenter.default.post(name: .showDiversityView, object: nil)

    }
    
    @IBAction func OnDistanceClick(_ sender: Any) {
        print("distance clicked")
        justToggled(sender as! NSButton)
        NotificationCenter.default.post(name: .showDistanceView, object: nil)

    }
    
    @IBAction func OnStructureClick(_ sender: Any) {
        print("structure clicked")
        justToggled(sender as! NSButton)
        NotificationCenter.default.post(name: .showStructureView, object: nil)

    }
    
    @IBAction func OnPopGraphClick(_ sender: Any) {
        print("popgraph clicked")
        justToggled(sender as! NSButton)
        NotificationCenter.default.post(name: .showPopGraphView, object: nil)

    }
    
    private func justToggled(_ sender: NSButton ) {
        if dataButton.state == .on && !(sender == dataButton )  {
            dataButton.state = .off
        }
        else if diversityButton.state == .on && !(sender == diversityButton )  {
            diversityButton.state = .off
        }
        else if distanceButton.state == .on && !(sender == distanceButton )  {
            distanceButton.state = .off
        }
        else if structureButton.state == .on && !(sender == structureButton )  {
            structureButton.state = .off
        }
        else if popgraphButton.state == .on && !(sender == popgraphButton )  {
            popgraphButton.state = .off
        }
        
    }
}

