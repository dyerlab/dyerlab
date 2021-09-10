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
//  GraphScene.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.
//

import Foundation
import SpriteKit



public class GraphScene: SKScene {
    
    /// The Graph
    var graph: Graph
    
    
    
    override init(size: CGSize){
        
        self.graph = Graph()
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

