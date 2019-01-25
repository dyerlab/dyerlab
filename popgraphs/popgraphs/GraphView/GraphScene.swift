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
    

    
    func applyForces( temp: CGFloat ) -> Bool {
        var ret = false
        let lengthConst:CGFloat = 4.0
        let weightConst:CGFloat = 10.0
        let numNodes = theGraph!.nodes.count
        let K = CGFloat(sqrtf( 1.0 * ( Float(self.size.width*self.size.height)/Float(numNodes))) * 50.0 )
        
        for i in 0..<numNodes {
            
            let n1 = theGraph!.nodes[i]
            
            // Repulsive forces
            var vel: CGPoint = CGPoint(x: 0.0, y: 0.0)
            
            for j in 0..<numNodes {
                if i != j {
                    let n2 = theGraph!.nodes[j]
                    let delta = n1.position - n2.position
                    let l = ( pow(delta.x,2.0) + pow(delta.y,2.0) * lengthConst )
                    if l > 0 {
                        vel.x = vel.x + delta.x / l + (K*K/l)
                        vel.y = vel.y + delta.y / l + (K*K/l)
                    }
                }
            }
            
            // Attractive forces
            for j in 0..<n1.edges.count {
                let e = n1.edges[j]
                let n2 = e.node1 == n1 ? e.node2 : e.node1
                let wt = e.weight * weightConst
                let delta = n1.position - n2.position
                vel.x += delta.x / wt
                vel.y += delta.y / wt
            }
            
            //correct for out-of-scene
            if abs(vel.x) > temp {
                vel.x = temp * abs(vel.x)/vel.x
            }
            if abs(vel.y) > temp {
                vel.y = temp * abs(vel.y)/vel.y
            }
            
            // flag for still moving
            if vel != CGPoint(x: 0, y: 0) {
                ret = true
            }
            
            vel = vel + n1.position
            
            vel.x = min(  max( vel.x, (10.0+n1.calculateAccumulatedFrame().width) ),
                          (self.size.width - (10 + n1.calculateAccumulatedFrame().width ) ) )
            
            vel.y = min(  max( vel.y, (10.0+n1.calculateAccumulatedFrame().height) ),
                          (self.size.height - (10 + n1.calculateAccumulatedFrame().height ) ) )
            
            // will trigger a move for the edges as well.
            n1.position = vel
            
        }
        
        return ret
    }
    

}
