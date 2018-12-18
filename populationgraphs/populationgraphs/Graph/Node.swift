//
//  Node.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

class Node: SCNNode {
    
    var diffuseColor: CGColor?
    var specularColor: CGColor?
    var labelNode: SCNNode!
    var radius: CGFloat = 1.0
    var label : String {
        get {
            return (labelNode.geometry as! SCNText).string as! String
        }
    }
    
    override init() {
        super.init()
        diffuseColor = CGColor.init( red: 168.0/255.0,
                                     green: 221.0/255.0,
                                     blue: 181.0/255.0,
                                     alpha: 1.0 )
        specularColor = CGColor.white
        
        position = SCNVector3.init(x: CGFloat.random(in: 0..<10),
                                   y: CGFloat.random(in: 0..<10),
                                   z: CGFloat.random(in: 0..<10) )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(size: CGFloat, label: String) {
        radius = size
        let text = SCNText(string: label, extrusionDepth: 0.25)
        text.font = NSFont(name: "Helvetica", size: 1.0)
        text.firstMaterial?.diffuse.contents = NSColor.labelColor
        text.firstMaterial?.specular.contents = CGColor.white 
        labelNode = SCNNode(geometry: text )
        labelNode.position = SCNVector3(x: radius, y: 0.0, z: size)
        labelNode.constraints = [ SCNBillboardConstraint() ]
        addChildNode(labelNode)

        
        let sphere = SCNSphere(radius: size)
        sphere.isGeodesic = true
        sphere.firstMaterial!.diffuse.contents = diffuseColor
        sphere.firstMaterial!.specular.contents = specularColor
        self.geometry = sphere
        
        // Set up gravity physics body
        let gravityField = SCNPhysicsField.radialGravity()
        gravityField.strength = 7500
        self.physicsField = gravityField
        let shape = SCNPhysicsShape(geometry: sphere, options: nil)
        let shapeBody = SCNPhysicsBody(type: .kinematic, shape: shape)
        self.physicsBody = shapeBody
        
    }
    
    
    
}


// MARK: Visibility Items
extension Node {
    
    func toggleLabel() {
        if self.childNodes.contains(labelNode) {
            labelNode.removeFromParentNode()
        }
        else {
            self.addChildNode(labelNode)
        }
    }
    
    
    func resize( val: CGFloat ) {
        let newSize = radius * val
        (geometry as! SCNSphere).radius = newSize
        let action = SCNAction.moveBy(x: newSize-radius, y: 0, z: newSize-radius, duration: 0.5)
        labelNode.runAction(action)
        radius = newSize
        
    }
}



// MARK: Movement stuff
extension Node {
    
    
    func shift( displacement: SCNVector3, duration: Double = 0.5 ) {
        let action = SCNAction.move(by: displacement, duration: duration)
        runAction( action )
    }
    
}



