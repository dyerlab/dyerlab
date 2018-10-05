//
//  LophoGraph.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


public func makeLophoGraph() -> Graph {
    let G = Graph()
    
    let labels = ["BaC", "Ctv", "LaV", "Lig", "PtC", "PtP", "SLG", "SnE", "SnF", "SnI",
                  "StR", "TsS", "CP", "LF", "PL", "SenBas", "Seri", "SG", "SI", "SN", "TS"]
    let weight = 1.0
    let edges = [ ["BaC", "LaV"],    ["BaC", "Lig"],    ["BaC", "PtC"],   ["BaC", "PtP"],    ["BaC", "SnE"],
                  ["BaC", "SnI"],    ["BaC", "StR"],    ["Ctv", "PtP"],   ["Ctv", "SLG"],    ["Ctv", "SnF"],
                  ["Ctv", "SenBas"], ["LaV", "Lig"],    ["LaV", "PtC"],   ["LaV", "SnE"],    ["LaV", "SnF"],
                  ["LaV", "TsS"],    ["Lig", "PtC"],    ["Lig", "SnI"],   ["Lig", "StR"],    ["Lig", "TsS"],
                  ["PtC", "SnE"],    ["PtC", "StR"],    ["PtC", "TsS"],   ["PtC", "SenBas"], ["PtP", "SnF"],
                  ["PtP", "SnI"],    ["PtP", "SenBas"], ["SLG", "SnF"],   ["SLG", "SnI"],    ["SnE", "StR"],
                  ["SnE", "TsS"],    ["SnF", "SnI"],    ["SnI", "StR"],   ["StR", "TsS"],    ["StR", "SenBas"],
                  ["CP", "Seri"],    ["CP", "SG"],      ["CP", "SN"],     ["CP", "TS"],      ["LF", "PL"],
                  ["LF", "SG"],      ["LF", "SI"],      ["PL", "SenBas"], ["PL ", "SG"],     ["PL", "SI"],
                  ["PL", "SN"] ]
    
    for label in labels {
        G.addNode(label: label)

    }
    
    for edge in edges {
        G.addEdge(from: edge.first!, to: edge.last!, weight: weight )
    }
    
    return G
}
