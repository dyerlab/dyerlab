//
//  Graph.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

struct GraphDecoder : Decodable {
    let nodes: [NodeDecoder]
    let links: [LinkDecoder]
    
    enum CodingKeys : String, CodingKey {
        case nodes = "nodes"
        case links = "links"
    }
}

struct NodeDecoder : Decodable {
    let size: CGFloat?
    let name: String
}


struct LinkDecoder : Decodable {
    let source: Int
    let target: Int
    let weight: CGFloat
}
