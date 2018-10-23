//
//  PopulationGraphVC.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/20/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class PopulationGraphVC: NSViewController {
    
    @IBOutlet weak var skView: SKView!
    var scene: PopulationGraphScene?
    var node: GraphNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene = PopulationGraphScene()
        scene?.size = CGSize(width: 1000, height: 1000)
    }
    
    override func viewWillAppear() {
        skView.presentScene(scene)
    }
    
    
    
//    func setPopulationGraph( theGraph: Graph ) {
//        self.graph = theGraph
//        for node in self.graph!.nodes {
//            scene?.addChild(node)
//        }
//    }
    
}



extension PopulationGraphVC {
    
//    public func loadHumanGraph() -> Graph? {
//        if let url = Bundle.main.url(forResource: "HumanGraph", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: url)
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode( Graph.self, from: data)
//                return jsonData
//            } catch {
//                print("error:\(error)")
//            }
//        }
//        return nil
//    }
    
}


