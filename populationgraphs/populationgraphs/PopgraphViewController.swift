//
//  SCNViewController.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class PopgraphViewController: NSViewController {

    @IBOutlet weak var scnView: SCNView!
    var scene: GraphScene!
    var document: Document? {
        get {
            return view.window?.windowController?.document as? Document
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene = GraphScene()
        scene.config()
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.backgroundColor = NSColor.windowBackgroundColor
        scnView.autoenablesDefaultLighting = true 
        
    }
    
    override func viewDidAppear() {
        if self.document != nil {
            scene.rootNode.addChildNode( document!.graph.root )
        }
        else {
            print("docuement was nil in viewDidAppear")
        }
    }
    
    
    @IBAction func OnToggleShowDiagnostics( _ sender: AnyObject ) {
        scnView.showsStatistics = !scnView.showsStatistics
    }

    @IBAction func OnToggleLabel(_ sender: AnyObject?) {
        document!.graph.nodes.forEach { $0.toggleLabel() }
    }
    
}
