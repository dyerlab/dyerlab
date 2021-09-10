//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  DLabGraph
//  Node-Plottable.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation
import SpriteKit

public class Node2D: Node {
    
    /// The underlying SKNode
    var skNode: SKNode
    
    /// Override to move node
    override var position: Vector {
        didSet {
            skNode.position.x = self.position[0]
            skNode.position.y = self.position[1]
        }
    }
    
    
    /// Default Init
    override init( size: Double = 1.0, label: String = "Node")  {
        self.skNode = SKSpriteNode(imageNamed: "Node")
        
        super.init(size: size, label: label)
        
        
    }
    
    
}
