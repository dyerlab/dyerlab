//
//  Edge.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit


class Edge  {
    var node1: Node
    var node2: Node
    var lineNode: SKShapeNode
    
    init( n1: Node, n2: Node, weight: CGFloat ) {
        self.node1 = n1
        self.node2 = n2
        self.lineNode = SKShapeNode()
        self.lineNode.isAntialiased = true
        self.lineNode.zPosition = -1
        self.lineNode.lineWidth = weight
        self.node1.edges.append(self)
        self.node2.edges.append(self)
        makePath()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makePath() {
        let path = CGMutablePath()
        path.move(to: node1.position )
        path.addLine(to: node2.position )
        lineNode.path = path
        lineNode.strokeColor = NSColor.alternateSelectedControlColor
    }
    
    
}


