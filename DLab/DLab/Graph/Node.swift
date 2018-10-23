//
//  Vertex.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

public class Node : SCNNode {
    
    public var displacement: SCNVector3
    public var label: String
    public var size: Double
    public var edges: Array<Edge>
    public var degree: Int {
        get {
            return edges.count
        }
    }
    
    public init(label: String, size: Double = 1.0) {
        self.label = label
        self.edges = Array<Edge>()
        self.displacement = SCNVector3Make( 0, 0, 0 )
        self.size = size
        
        super.init()
        
        self.geometry = SCNSphere(radius: 1.0)
        //self.position = SCNVector3Make(0, 0, 0)
        self.position = SCNVector3Make( CGFloat.random(in: 0.0...10.0),
                                        CGFloat.random(in: 0.0...10.0),
                                        CGFloat.random(in: 0.0...10.0) )
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = NSColor.darkGray
        self.geometry?.materials = [ redMaterial ]
        
        // Attach a physics body to it
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: self, options: nil))
        physicsBody.mass = CGFloat(self.size)
        physicsBody.friction = 0.2
        physicsBody.contactTestBitMask = 1
        self.physicsBody = physicsBody
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


