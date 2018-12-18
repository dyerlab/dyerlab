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
        
        let vector = n2.position - n1.position
        let ht = CGFloat( vector.length() )
        let cylinder = SCNCylinder(radius: 0.1, height: ht)
        cylinder.radialSegmentCount = 8
        self.geometry = cylinder
        self.position = (n2.position + n1.position) / CGFloat(2.0)
        self.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
        
        
        print("edge configured at \(self.position)")
    }
    
}

//class Edge : SKShapeNode {
//
//    let node1: Node
//    let node2: Node
//    let weight: CGFloat
//
//    init( n1: Node, n2: Node, weight: CGFloat ) {
//        self.node1 = n1
//        self.node2 = n2
//        self.weight = weight
//
//        super.init()
//        self.name = "Edge"
//
//        let path = CGMutablePath()
//        path.move(to: node1.position )
//        path.addLine(to: node2.position )
//
//        self.path = path
//        self.strokeColor = NSColor.white
//        self.lineWidth = 5.0
//        self.glowWidth = 0.5
//        self.fillColor = NSColor.red
//
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
