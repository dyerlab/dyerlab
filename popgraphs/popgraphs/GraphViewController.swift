//
//  ViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphViewController: NSViewController {

    @IBOutlet weak var theView: SKView!
    
    
    var scene: GraphScene?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scene = GraphScene(size: theView.bounds.size )
        theView.presentScene(scene)
        
        print("GVC:vDL()")
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    
}





extension GraphViewController {
    
    @IBAction func OnToggleLabels( sender: Any? ) {
        let nodes = self.scene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.toggleLabel() }
    }
    
    @IBAction func OnScaleNodesLarger( sender: Any? ) {
        let nodes = self.scene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.rescale(scaleFactor: 1.1)}
    }
    
    @IBAction func OnScaleNodesSmaller( sender: Any? ) {
        let nodes = self.scene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.rescale(scaleFactor: 1.0/1.1)}
    }
    
}

