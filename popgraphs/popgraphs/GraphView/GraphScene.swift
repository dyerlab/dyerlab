//
//  GraphScene.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class GraphScene: SKScene {
    
    var selectedNode: Node? = nil
    var theGraph: Graph?
    
    override init(size: CGSize ) {
        
        super.init(size: size)
        self.backgroundColor = NSColor.windowBackgroundColor
        
        print("Init of Scene (\(size))")
        
        self.scaleMode = .resizeFill
        self.isUserInteractionEnabled = true
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension GraphScene {
    
    override func mouseDown(with event: NSEvent) {
        let location = event.location(in: self)
        self.selectedNode = self.nodes(at: location).filter { $0 is Node }.first as? Node
        if self.selectedNode != nil {
            
            print( self.selectedNode?.name ?? "nothing")
        }
    }
    
    override func mouseUp(with event: NSEvent) {
        self.selectedNode = nil
    }
    
    
    override func mouseDragged(with event: NSEvent) {
        
        if self.selectedNode != nil {
            self.selectedNode?.position = event.location(in: self)
            self.selectedNode?.didMove()
        }
    }
    
    
    func didResize(rect: CGRect) {
        print("didResize: \(rect)")
        theGraph?.recenterNodes(newRect: rect)
    }
    
    
    // Override here to make sure edges catch up
    override func didEvaluateActions() {
        
        if theGraph == nil {
            return
        }
        
        for node in (theGraph?.nodes)!  {
            if node.canMove() {
                node.didMove()
            }
        }
    }
    
}




extension GraphScene {
    
    
    public func setGraph( graph: Graph ) {
        
        if theGraph != nil {
            theGraph!.nodes.forEach { $0.removeFromParent() }
            theGraph!.edges.forEach { $0.lineNode.removeFromParent() }
        }
        
        graph.nodes.forEach { self.addChild( $0 ) }
        graph.edges.forEach { self.addChild( $0.lineNode ) }
        graph.nodes.forEach { $0.randomizeLocation(width: self.size.width, height: self.size.height) }
        graph.nodes.forEach { $0.didMove() }
        
        self.theGraph = graph
    }
    

    
    
//    func calculateNodeForces(temp: CGFloat) -> Bool {
//        var ret = false
//        let numNodes = graph!.nodes.count
//        let numEdges = graph!.edges.count
//        let K = CGFloat(sqrtf( 1.0 * ( Float(self.size.width*self.size.height)/Float(numNodes))) * 50.0)
//        
//        for i in 0 ..< numNodes {
//            let node1 = self.graph!.nodes[i]
//            var xvel: CGFloat = 0.0
//            var yvel: CGFloat = 0.0
//            
//            
//            // repulsive Forces
//            if node1 != self.selectedNode {
//                for j in 0 ..< numNodes {
//                    if i != j {
//                        let node2 = self.graph!.nodes[j]
//                        let vec = CGVector.init(pt1: node1.position, pt2: node2.position)
//                        let l = CGFloat( (vec.dx * vec.dx + vec.dy * vec.dy) * 4.0 )
//                        if l > 0 {
//                            xvel = xvel + (vec.dx/l) * (K*K)/l
//                            yvel = yvel + (vec.dy/l) * (K*K)/l
//                        }
//                    }
//                }
//            }
//            
//            // Attractive Forces
//            for j in 0 ..< self.graph!.edges.count {
//                let e = graph!.edges[j]
//                
//            }
//        }
//        
//        
//        return ret
//    }
}
