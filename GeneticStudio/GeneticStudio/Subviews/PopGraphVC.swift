//
//  PopGraphVC.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/19/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa
import SceneKit


class PopGraphVC: NSViewController {

    @IBOutlet weak var sceneView: SCNView!
    var scene: GraphScene?
    //var graph: Graph?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        scene = GraphScene()
        sceneView.scene = scene
        sceneView.allowsCameraControl = true
        
        //addGraph( theGraph: loadHumanGraph()! )
        
    }
    
}




extension PopGraphVC {

//    public func addGraph( theGraph: Graph ) {
//        self.graph = theGraph
//        for node in (graph?.nodes)! {
//            scene?.rootNode.addChildNode(node)
//            print(node.description)
//        }
//    }
    
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
