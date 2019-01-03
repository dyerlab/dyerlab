//
//  GraphViewController.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphViewController: NSViewController {

    @IBOutlet var theView: SKView!
    
    var scene: GraphScene?
    
    var document: Document? {
        get {
            return view.window?.windowController?.document as? Document
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         let edgeCategoryBitmask: UInt32 = 0x1 << 2
        
        scene = GraphScene(size: theView.frame.size )
        print( theView.bounds.size )
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: view.bounds.standardized)
        scene!.physicsBody?.friction = 0
        scene!.physicsBody?.categoryBitMask = edgeCategoryBitmask
        scene!.scaleMode = .resizeFill


        theView.showsFPS = true
        theView.showsNodeCount = true
        theView.ignoresSiblingOrder = true
        theView.showsPhysics = true
        theView.presentScene(scene)
        
        
        
        let node1 = Node()
        node1.position = CGPoint(x: 200, y: 150)
        let node2 = Node()
        node2.position = CGPoint(x: 300, y: 150)
        node2.color = NSColor.orange
        scene?.addChild(node1)
        scene?.addChild(node2)
        
        
        
    }
    
    
    
}
