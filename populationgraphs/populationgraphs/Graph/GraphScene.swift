//
//  PopgraphScene.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit

class GraphScene: SCNScene {
    
    var cameraNode: SCNNode!
    var lightNode: SCNNode!
    var gridNode: SCNNode!
    var groundNode: SCNNode!
    var temperature: CGFloat = 10.0

    
    func config() {
    
        let floor = SCNFloor()
        floor.reflectivity = 0.1
        let floorMaterial = SCNMaterial()
        floorMaterial.diffuse.contents = NSColor.darkGray
        floor.materials = [floorMaterial]
        groundNode = SCNNode(geometry: floor)
        groundNode.position = SCNVector3(x: 0, y: -25, z: 0)
        rootNode.addChildNode(groundNode)
        
        
        let ambientLight = SCNLight()
        ambientLight.type = .ambient
        ambientLight.intensity = 75.0
        rootNode.light = ambientLight
        
        gridNode = SCNNode(geometry: SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1) )
        gridNode.position = SCNVector3(x: 0.0, y: 0.0, z: 0.0)
        rootNode.addChildNode( gridNode )
        
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.zFar = 200.0
        cameraNode.position = SCNVector3(x: 0.0, y: 10.0, z: 100)
        cameraNode.constraints = [ SCNLookAtConstraint(target: rootNode) ]
        rootNode.addChildNode(cameraNode)

        lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 0, z: 50)
        rootNode.addChildNode(lightNode)
        
        
        
        physicsWorld.gravity = SCNVector3(x: 0, y: 0, z: 0)

        
        
        
//        let anc = SCNSphere(radius: 0.01)
//        let ancNode = SCNNode(geometry: anc)
//        ancNode.position = SCNVector3(x: 0, y: 0, z: 0)
//
//
//        let node1 = Node()
//        node1.config(size: 1, label: "bob")
//        node1.position = SCNVector3(x: -8, y: 0, z: 0)
//
//        let node2 = Node()
//        node2.config(size: 1, label: "alice")
//        node2.position = SCNVector3(x: 8, y: 0, z: 0)
//
//
//
//        let edge = Edge(n1: node1, n2: node2, wt: 5)
//        //let edge = SCNNode.lineBetween(nodeA: node1, nodeB: node2)
//
//        ancNode.addChildNode(node1)
//        ancNode.addChildNode(node2)
//        ancNode.addChildNode(edge)
//
//        rootNode.addChildNode(ancNode)
        
//        physicsWorld.addBehavior(edge.joint1!)
//        physicsWorld.addBehavior(edge.joint2!)
        
    }

}




extension GraphScene {
    
    public func removeAllNodes() {
        rootNode.enumerateChildNodes { (node, stop) in
            if node != cameraNode &&
                node != lightNode &&
                node != gridNode &&
                node != groundNode {
                node.removeFromParentNode()
            }
        }
    }
    
    public func addGraph( graph: Graph ) {
        rootNode.addChildNode(graph.root)
        graph.center(on: SCNVector3Zero )
        cameraNode.constraints = [ SCNLookAtConstraint(target: graph.root) ]
    }
}
