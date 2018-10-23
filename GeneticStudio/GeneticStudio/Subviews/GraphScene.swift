//
//  GraphScene.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit


public class GraphScene: SCNScene {
    
    var boxNode: SCNNode
    var cameraNode: SCNNode
    var omniLightNode: SCNNode
    var ambientLightNode: SCNNode
    
    
    public override init() {
        
        
        let rootGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1)
        boxNode = SCNNode(geometry: rootGeometry)
        
        ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = CGColor(gray: 0.67, alpha: 1.0)

        omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = .omni
        omniLightNode.light!.color = CGColor(gray: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        
        super.init()
        
        self.rootNode.addChildNode(boxNode)
        self.rootNode.addChildNode(ambientLightNode)
        self.rootNode.addChildNode(omniLightNode)
        self.rootNode.addChildNode(cameraNode)
        
        // Turn off gravity
        self.physicsWorld.gravity = SCNVector3Make(0, 0, 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
