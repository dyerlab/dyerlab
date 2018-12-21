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
    
    var scene: PopGraphScene!
    var timer: Timer!
    
    var document: Document? {
        get {
            return view.window?.windowController?.document as? Document
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene = PopGraphScene()
        scene.config()
        
        scnView.scene = scene
        scnView.allowsCameraControl = true
        scnView.backgroundColor = NSColor.windowBackgroundColor
        scnView.autoenablesDefaultLighting = true 
        
        
       
    }
    
    override func viewDidAppear() {
        if self.document != nil {
            
            
            document!.graph = Graph.makeHumanGraph()
            
            
            
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
                
            case 15: // R key
                let action = SCNAction.move(to: SCNVector3(x: 0.0, y: 10.0, z: 50), duration: 0.5)
                scene.cameraNode.runAction( action )
                print("recentering camera")
                
            case 33:  // { key
                document!.graph?.nodes.forEach { $0.resize(val: (1.0/1.1) ) }
                print("shrink node")
                
            case 30:  // } key
                document!.graph?.nodes.forEach { $0.resize(val: 1.1) }
                print("grow node")
                
            case 37:  // l key
                minimizeSpring(graph: document!.graph! )
                print("minimizing spring")
                
            case 69: // + key on keypad
                document!.graph?.nodes.forEach { $0.physicsField?.strength = ($0.physicsField?.strength)! + 0.1 }
                print("keypad plus: now \(document!.graph?.nodes.first?.physicsField?.strength ?? 0.0)")
                
            case 78: // - key on keypad
                document!.graph?.nodes.forEach { $0.physicsField?.strength = ($0.physicsField?.strength)! - 0.1 }
                print("keypad minus: now \(document!.graph?.nodes.first?.physicsField?.strength ?? 0.0)")

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






extension PopgraphViewController {
    
    public func toggleTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(self.timerFireMethod), userInfo: nil, repeats: true)
        }
        else if timer.isValid {
            timer.invalidate()
            timer = nil
            scene.temperature = 10.0
        }
    }
    
    @objc public func timerFireMethod( timer: Timer ) {
    
        scene.temperature = (scene.temperature > 0.5) ? 0.9 * scene.temperature : 0.45
        
        
        if !calculateNodeForces(graph: document!.graph!, temperature: scene.temperature) {
            toggleTimer()
        }
    }
    
}
