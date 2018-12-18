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
            if document!.graph != nil {
                scene.rootNode.addChildNode( document!.graph!.root )
            }
        }
        else {
            print("docuement was nil in viewDidAppear")
        }
    }
    
    
    
}



// MARK: Extensions for keyboard stuff

extension PopgraphViewController {
    
    override func keyDown(with event: NSEvent) {
        
        // command
        
        
        if event.modifierFlags.intersection(.deviceIndependentFlagsMask).contains(.command) {
            
            switch event.keyCode {
                
            case 123:
                scene.cameraNode.position.x = scene.cameraNode.position.x + 1.0
                print("command-left arrow")
                
            case 124:
                scene.cameraNode.position.x = scene.cameraNode.position.x - 1.0
                print("command-right arrow")
                
            case 125:
                scene.cameraNode.position.y = scene.cameraNode.position.y + 1.0
                print("command-down arrow")
                
            case 126:
                scene.cameraNode.position.y = scene.cameraNode.position.y - 1.0
                print("command-up arrow")
                
            default:
                break
            }
            
        }
        else {  // NO .command modifier
            
            switch event.keyCode {
                
            case 8:  // C key
                document!.graph?.moveAboveFloor()
                print("moving")
                
            case 33:  // { key
                document!.graph?.nodes.forEach { $0.resize(val: (1.0/1.1) ) }
                print("shrink node")
                
            case 30:  // } key
                document!.graph?.nodes.forEach { $0.resize(val: 1.1) }
                print("grow node")
                
            default:
                print("Unhandled keycode: \(event.keyCode)")
                break;
            }

            
        }
    }
    
    override var acceptsFirstResponder : Bool {
        return true
    }
    
    @IBAction func OnToggleShowDiagnostics( _ sender: AnyObject ) {
        scnView.showsStatistics = !scnView.showsStatistics
    }
    
    @IBAction func OnToggleLabel(_ sender: AnyObject?) {
        if document!.graph != nil {
            document!.graph!.nodes.forEach { $0.toggleLabel() }
        }
    }
    
    @IBAction func OnRightCursorDown(_ sender: AnyObject?) {
        scene.cameraNode.position.x = scene.cameraNode.position.x - 1.0
    }
    
    @IBAction func OnLeftCursorDown(_ sender: AnyObject?) {
        scene.cameraNode.position.x = scene.cameraNode.position.x + 1.0
    }
    
    
    
    
}
