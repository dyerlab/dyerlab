////
////  parts.swift
////  PopulationGraphs
////
////  Created by Rodney Dyer on 9/25/18.
////  Copyright © 2018 Rodney Dyer. All rights reserved.
////
//
//import Foundation
//import Cocoa
//import SceneKit
//
//
//func viewControllerDidLoadForSCNView() {
//    //sceneView.debugOptions = [ .showPhysicsShapes ]
////    theView.backgroundColor = NSColor.black
////    theView.showsStatistics = true
////
////    let scene = SCNScene()
////    theView.scene = scene
////
////    let camera = SCNCamera()
////    let cameraNode = SCNNode()
////    cameraNode.camera = camera
////    cameraNode.position = SCNVector3(x: -23, y: 23, z: 23)
////
////    let light = SCNLight()
////    light.type = SCNLight.LightType.spot
////    light.spotInnerAngle = 30.0
////    light.spotOuterAngle = 80.0
////    light.castsShadow = true
////
////    let lightNode = SCNNode()
////    lightNode.light = light
////    lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
////
////    let ambientLight = SCNLight()
////    ambientLight.type = SCNLight.LightType.ambient
////    ambientLight.color = NSColor(calibratedRed: 0.4, green: 0.4, blue: 0.4, alpha: 1.0  )
////    cameraNode.light = ambientLight
////
////
////    let baseNode = SCNNode()
////    baseNode.position = SCNVector3(x: 0, y: 0, z: 0)
////
////
////    let constraint = SCNLookAtConstraint(target: baseNode )
////    constraint.isGimbalLockEnabled = true
////    cameraNode.constraints = [constraint]
////    lightNode.constraints = [constraint]
////
////
////    let floor = FloorNode()
////
////    let node1 = GraphNode(label: "Robert", size: 1.1)
////    node1.position.y = 10.0
////
////    let node2 = GraphNode(label: "Alex", size:2.5 )
////    node2.position.y = 18.0
////    node2.position.x = 5.2
////
////    //let line = SCNGeometry.line(from: node1.position, to: node2.position)
////    //let lineNode = SCNNode(geometry: line)
////    //in your code, you can like this.
////    let edgeNode = SCNNode()
////    scene.rootNode.addChildNode(lightNode)
////    scene.rootNode.addChildNode(cameraNode)
////    scene.rootNode.addChildNode( node1 )
////    scene.rootNode.addChildNode( node2 )
////
////    scene.rootNode.addChildNode( edgeNode.buildLineInTwoPointsWithRotation(from: node1.position,
////                                                                           to: node2.position,
////                                                                           radius: 0.1,
////                                                                           color: NSColor.yellow) )
////    scene.rootNode.addChildNode( floor )
//}
//
//
////
////  PopgraphNode.swift
////  PopulationGraphs
////
////  Created by Rodney Dyer on 9/22/18.
////  Copyright © 2018 Rodney Dyer. All rights reserved.
////
//
//import Foundation
//import SceneKit
//
//
//protocol GraphObject {
//    var label: String { get set }
//    var showingLabel: Bool { get set }
//    
//    func toggleLabel()
//}
//
//
//class GraphNode : SCNNode, GraphObject {
//    
//    var label: String
//    var size: CGFloat
//    var showingLabel: Bool
//    var material: SCNMaterial
//    
//    func toggleLabel() {
//        self.showingLabel = !self.showingLabel
//    }
//    
//    init(label: String = "Bob", size: CGFloat = 1.0 ) {
//        self.label = label
//        self.showingLabel = true
//        self.material = SCNMaterial()
//        material.diffuse.contents = NSColor.systemPink
//        self.size = size
//        super.init()
//        
//        geometry = SCNSphere(radius: size)
//        geometry?.materials = [ material ]
//        position = SCNVector3Make(0, 0, 0)
//        
//        // Attach a physics body to it
//        let physicsBody = SCNPhysicsBody(type: .dynamic,
//                                         shape: SCNPhysicsShape(geometry: SCNSphere(radius: self.size),
//                                                                options: nil))
//        physicsBody.mass = self.size
//        physicsBody.friction = 0.2
//        physicsBody.contactTestBitMask = 1
//        self.physicsBody = physicsBody
//        
//        castsShadow = true
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
//
//
//
//
