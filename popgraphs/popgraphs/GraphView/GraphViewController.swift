//
//  GraphViewController.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit


class GraphViewController: NSViewController {
    
    @IBOutlet weak var graphView: GraphView!
    
    var theScene: GraphScene?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        theScene = GraphScene(size: graphView.skView.bounds.size )
    
        graphView.skView.presentScene(theScene)
    }
    
}





// MARK: Visual toggles of stuff
extension GraphViewController {
    
    @IBAction func OnToggleLabels( sender: Any? ) {
        let nodes = self.theScene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.toggleLabel() }
    }
    
    @IBAction func OnScaleNodesLarger( sender: Any? ) {
        let nodes = self.theScene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.rescale(scaleFactor: 1.1)}
    }
    
    @IBAction func OnScaleNodesSmaller( sender: Any? ) {
        let nodes = self.theScene!.children.filter {$0 is Node } as! [Node]
        nodes.forEach { $0.rescale(scaleFactor: 1.0/1.1)}
    }
    
}

