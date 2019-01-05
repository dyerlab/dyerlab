//
//  Node.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class Node: SKSpriteNode {

    var displacement: CGPoint
    let nodeCategoryBitmask: UInt32 = 0x1 << 1
    var edges: [Edge]
    var labelNode: SKLabelNode
    var degree: Int {
        get {
            return edges.count
        }
    }
    
    init(label: String, size: CGFloat) {
        let texture = SKTexture(imageNamed: "Node")
        self.edges = Array<Edge>()
        self.displacement = CGPoint(x: 0.0, y: 0.0)
        self.labelNode = SKLabelNode(text: label)
        self.labelNode.position = CGPoint(x: size, y: size)
        
        super.init( texture: texture, color: NSColor.white, size: texture.size() )
        self.resize(radius: size)
        self.addChild(labelNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




// MARK: Movement
extension Node {
    
    func didMove() {
        for edge in edges {
            edge.makePath()
        }
    }
    
    func canMove() -> Bool {
        return self.displacement == CGPoint(x: 0.0, y: 0.0)
    }
    
    func randomizeLocation(width: CGFloat, height: CGFloat) {
        self.position = CGPoint(x: CGFloat.random(in: 0...width),
                                y: CGFloat.random(in: 0...height) )
    }
}




// MARK: Appearance
extension Node {
    
    func resize( radius: CGFloat ) {
        self.size = CGSize(width: radius, height: radius)
    }
    
    
    func rescale( scaleFactor: CGFloat ) {
        self.size = CGSize(width: self.size.width * scaleFactor,
                           height:  self.size.height * scaleFactor)
    }
    
    func toggleLabel() {
        if self.children.contains( labelNode ) {
            labelNode.removeFromParent()
        }
        else {
            addChild( labelNode )
        }
    }

}
