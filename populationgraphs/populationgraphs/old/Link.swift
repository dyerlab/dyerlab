//
//  Link.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

extension SCNNode {
    
    
    static func lineNode(from: SCNVector3, to: SCNVector3, radius: CGFloat = 0.25) -> SCNNode {
        let vector = to - from
        let height = vector.length()
        let cylinder = SCNCylinder(radius: radius, height: CGFloat(height))
        cylinder.radialSegmentCount = 4
        let node = SCNNode(geometry: cylinder)
        node.position = (to + from) / 2
        node.eulerAngles = SCNVector3.lineEulerAngles(vector: vector)
        return node
    }
    
    
    
    class func lineBetween(nodeA: SCNNode, nodeB: SCNNode) -> SCNNode {
        let positions: [Float32] = [Float(nodeA.position.x),
                                    Float(nodeA.position.y),
                                    Float(nodeA.position.z),
                                    Float(nodeB.position.x),
                                    Float(nodeB.position.y),
                                    Float(nodeB.position.z)]
        let positionData = NSData(bytes: positions, length: MemoryLayout<Float32>.size*positions.count)
        let indices: [Int32] = [0, 1]
        let indexData = NSData(bytes: indices, length: MemoryLayout<Int32>.size * indices.count)
        
        let source = SCNGeometrySource(data: positionData as Data, semantic: SCNGeometrySource.Semantic.vertex, vectorCount: indices.count, usesFloatComponents: true, componentsPerVector: 3, bytesPerComponent: MemoryLayout<Float32>.size, dataOffset: 0, dataStride: MemoryLayout<Float32>.size * 3)
        let element = SCNGeometryElement(data: indexData as Data, primitiveType: SCNGeometryPrimitiveType.line, primitiveCount: indices.count, bytesPerIndex: MemoryLayout<Int32>.size)
        
        let line = SCNGeometry(sources: [source], elements: [element])
        return SCNNode(geometry: line)
    }
}
