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
                                          alpha: 1.0)
        specularColor = CGColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(size: CGFloat, label: String) {
        let text = SCNText(string: label, extrusionDepth: 0.25)
        text.font = NSFont(name: "Helvetica", size: 1.0)
        labelNode = SCNNode(geometry: text )
        labelNode.position = SCNVector3(x: size, y: 0.0, z: size)
        self.addChildNode(labelNode)
        
        let sphere = SCNSphere(radius: size)
        sphere.isGeodesic = true
        sphere.firstMaterial!.diffuse.contents = diffuseColor
        sphere.firstMaterial!.specular.contents = specularColor
        self.geometry = sphere
        
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
}




