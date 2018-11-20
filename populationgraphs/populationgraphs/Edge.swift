//
//  Edge.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit


class Edge : SKShapeNode {
    
    let node1: Node
    let node2: Node
    let weight: CGFloat
    
    init( n1: Node, n2: Node, weight: CGFloat ) {
        self.node1 = n1
        self.node2 = n2
        self.weight = weight
        let pts: [CGPoint]  = [ CGPoint(x: node1.position.x, y: node1.position.y),
                                CGPoint(x: node2.position.x, y: node2.position.y)]
        
        let path = CGMutablePath()
        path.addLines(between: pts)
        
        super.init()
        self.path = path
        
        self.lineWidth = self.weight
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
