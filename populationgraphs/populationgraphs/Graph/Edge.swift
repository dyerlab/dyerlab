//
//  Edge.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit


class Edge: SCNNode {
    
    var node1: Node?
    var node2: Node?
    var weight: CGFloat?
    var cylinder: SCNCylinder?
    var joint1: SCNPhysicsBallSocketJoint?
    var joint2: SCNPhysicsBallSocketJoint?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(n1: Node, n2: Node, wt: CGFloat) {
        self.weight = wt
        self.node1 = n1
        self.node2 = n2
        
        
        super.init()
        node1?.edges.append( self )
        node2?.edges.append( self )
        cylinder = SCNCylinder(radius: 0.1, height: 1.0)
        cylinder!.radialSegmentCount = 8
        self.geometry = cylinder
       
        self.reposition()

    }
    
    public func otherNode( node: Node ) -> Node {
        if node == node1 {
            return node2!
        }
        else {
            return node1!
        }
    }
    
}


extension Edge {
    
    func shift( displacement: SCNVector3, duration: Double = 0.5 ) {
        let action = SCNAction.move(by: displacement, duration: duration)
        runAction( action )
    }
    
    public func reposition() {
        let vector = node2!.position - node1!.position
        self.cylinder?.height = CGFloat( vector.length() )
        self.position = (node2!.position + node1!.position) / CGFloat(2.0)
        self.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
    }
    
}
