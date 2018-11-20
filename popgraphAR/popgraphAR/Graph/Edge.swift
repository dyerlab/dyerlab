//
//  Edge.swift
//  DLab
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

public class Edge {
    public var node1: Node
    public var node2: Node
    public var weight: Double
    public var line: SCNNode

    
    public init(node1: Node, node2: Node, weight: Double = 1.0) {
        
        self.weight = weight
        self.node1 = node1
        self.node2 = node2

        let height = CGFloat( node1.position.distance(node2.position) )
                
        let geo = SCNCylinder(radius: 1.0, height: height ) 
        self.line = SCNNode(geometry: geo )
        self.line.position = node1.position
        self.line.constraints = [ SCNLookAtConstraint(target: node2) ]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Edge: Equatable {
    
    public static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.node1 == rhs.node1 &&
            lhs.node2 == rhs.node2 &&
            lhs.weight == rhs.weight &&
            lhs.line == rhs.line
    }
    
}



extension SCNNode {
    
    class func lineBetweenNodeA(nodeA: SCNNode, nodeB: SCNNode) -> SCNNode {
        let positions: [Float] = [nodeA.position.x, nodeA.position.y, nodeA.position.z,
                                    nodeB.position.x, nodeB.position.y, nodeB.position.z]
        let positionData = NSData(bytes: positions,
                                  length: MemoryLayout<Float32>.size*positions.count)
        let indices: [Int32] = [0, 1]
        let indexData = NSData(bytes: indices,
                               length: MemoryLayout<Int32>.size * indices.count)
        
        let source = SCNGeometrySource(data: positionData as Data,
                                       semantic: SCNGeometrySource.Semantic.vertex,
                                       vectorCount: indices.count,
                                       usesFloatComponents: true,
                                       componentsPerVector: 3,
                                       bytesPerComponent: MemoryLayout<Float32>.size,
                                       dataOffset: 0,
                                       dataStride: MemoryLayout<Float32>.size * 3 )
        
        let element = SCNGeometryElement(data: indexData as Data,
                                         primitiveType: SCNGeometryPrimitiveType.line,
                                         primitiveCount: indices.count,
                                         bytesPerIndex: MemoryLayout<Int32>.size)
        
        let line = SCNGeometry(sources: [source], elements: [element])
        return SCNNode(geometry: line)
    }

}



extension SCNGeometry {
    
    class func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        let indices: [Int32] = [0, 1]
        
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
        
    }
}


