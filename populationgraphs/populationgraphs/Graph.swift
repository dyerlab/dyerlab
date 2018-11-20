//
//  Graph.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

class Graph {
    var root: SKNode 
    var count: Int {
        get {
            return root.children.count
        }
    }
    
    init() {
        root = SKNode()
    }
    
    func addNode(label: String, size: CGFloat, color: NSColor = NSColor.red ) {
        
        let theNode = Node(size: size, color: color, label: label)
        
        root.addChild(theNode)
    }
    
    func addEdge( node1: Node, node2: Node, weight: CGFloat ) {
        
//        let spring = SKPhysicsJointSpring.joint(withBodyA: node1.physicsBody!,
//                                                bodyB: node2.physicsBody!,
//                                                anchorA: node1.position,
//                                                anchorB: node2.position)
//
//        self.root.scene?.physicsWorld.add(spring)
//
        
        root.addChild( Edge(n1: node1, n2: node2, weight: weight) )
        
    }
    
    func getNode( label: String ) -> Node? {
        for child in root.children {
            if let node = child as? Node {
                if node.labelNode.text == label {
                    return node
                }
            }
        }
        return nil
    }
}




// MARK: private stuff

extension Graph {
    
    func recenter( size: CGSize ) {
        for node in self.root.children {
            node.position.x = node.position.x * size.width
            node.position.y = node.position.y * size.height
        }
        
    }

    class func makeHumanGraph() -> Graph {
        
        let ret = Graph()
        
        let radii: [CGFloat] = [7.4578942537271, 8.38564840703482, 17.4814077852324, 13.9608493006285, 6.38267718725335, 6.30359670547128, 12.2073836442719, 8.76782875524144, 11.3159511799494, 6.5605345754562, 8.56993864278869, 6.56831052000211, 5, 8.44982876540007, 10.6897661741224, 6.91258297698224, 13.7358126623227, 7.38152263325782, 8.17514808048328, 8.01607626417922, 7.14998264039569, 10.2456363875964, 5.22070436753603, 7.69312418487855, 10.3535432085044, 5.1339081801508, 8.90296295993226, 9.4661998657112, 13.1690196555877]
        let labels: [String] = ["Adygei", "Balochi", "BantuKenya",
                                "BantuSouthAfrica", "Basque",
                                "Bedouin", "BiakaPygmy", "Burusho",
                                "Cambodian", "Colombian", "Daur",
                                "Druze", "Kalash", "Lahu",
                                "Mandenka", "Maya", "MbutiPygmy",
                                "Melanesian", "Mongola", "Mozabite",
                                "Palestinian", "Papuan", "Pima",
                                "Russian", "San", "Uygur",
                                "Yakut", "Yi", "Yoruba"]
        
        let edges: [[String]] = [
                                    ["Adygei", "Balochi"],
                                    ["Adygei", "Basque"],
                                    ["Adygei", "Bedouin"],
                                    ["Adygei", "Burusho"],
                                    ["Adygei", "Mozabite"],
                                    ["Adygei", "Palestinian"],
                                    ["Adygei", "Russian"],
                                    ["Balochi", "Bedouin"],
                                    ["Balochi", "Druze"],
                                    ["Balochi", "Kalash"],
                                    ["Balochi", "Melanesian"],
                                    ["Balochi", "Mozabite"],
                                    ["BantuKenya", "BantuSouthAfrica"],
                                    ["BantuKenya", "BiakaPygmy"],
                                    ["BantuKenya", "Mandenka"],
                                    ["BantuKenya", "Russian"],
                                    ["BantuKenya", "Yoruba"],
                                    ["BantuSouthAfrica", "Mandenka"],
                                    ["BantuSouthAfrica", "MbutiPygmy"],
                                    ["BantuSouthAfrica", "San"],
                                    ["BantuSouthAfrica", "Yoruba"],
                                    ["Basque", "Burusho"],
                                    ["Basque", "Kalash"],
                                    ["Basque", "Mozabite"],
                                    ["Basque", "Palestinian"],
                                    ["Basque", "Russian"],
                                    ["Bedouin", "Druze"],
                                    ["Bedouin", "Palestinian"],
                                    ["Bedouin", "Papuan"],
                                    ["Bedouin", "Uygur"],
                                    ["BiakaPygmy", "Mandenka"],
                                    ["BiakaPygmy", "MbutiPygmy"],
                                    ["BiakaPygmy", "Papuan"],
                                    ["BiakaPygmy", "San"],
                                    ["BiakaPygmy", "Yoruba"],
                                    ["Burusho", "Melanesian"],
                                    ["Cambodian", "Kalash"],
                                    ["Cambodian", "Lahu"],
                                    ["Cambodian", "Melanesian"],
                                    ["Cambodian", "Papuan"],
                                    ["Cambodian", "Pima"],
                                    ["Cambodian", "Uygur"],
                                    ["Colombian", "Daur"],
                                    ["Colombian", "Maya"],
                                    ["Colombian", "Pima"],
                                    ["Colombian", "Yakut"],
                                    ["Colombian", "Yi"],
                                    ["Daur", "Druze"],
                                    ["Daur", "Lahu"],
                                    ["Daur", "Yakut"],
                                    ["Daur", "Yi"],
                                    ["Druze", "Lahu"],
                                    ["Druze", "Maya"],
                                    ["Druze", "Mozabite"],
                                    ["Druze", "Palestinian"],
                                    ["Kalash", "Palestinian"],
                                    ["Kalash", "Uygur"],
                                    ["Kalash", "Yi"],
                                    ["Lahu", "Papuan"],
                                    ["Lahu", "Yi"],
                                    ["Mandenka", "Yoruba"],
                                    ["Maya", "Pima"],
                                    ["MbutiPygmy", "San"],
                                    ["Melanesian", "Mongola"],
                                    ["Melanesian", "Papuan"],
                                    ["Mongola", "Uygur"],
                                    ["Mongola", "Yakut"],
                                    ["Mongola", "Yi"],
                                    ["Mozabite", "Palestinian"],
                                    ["Mozabite", "Uygur"],
                                    ["Papuan", "San"],
                                    ["Pima", "San"],
                                    ["Russian", "Uygur"],
                                    ["Russian", "Yi"],
                                    ["San", "Yoruba"],
                                    ["Yakut", "Yi"]
                                ]
        
        for i in 0..<radii.count {
            ret.addNode(label: labels[i], size: radii[i], color: NSColor.darkGray)
        }
        
        
        for i in 0..<edges.count {
            if let n1 = ret.getNode(label: edges[i].first!) {
                if let n2 = ret.getNode(label: edges[i].last!) {
                    ret.addEdge(node1: n1, node2: n2, weight: 1.0)
                }
            }
        }
      
        
        print("Graph now has \(ret.count) nodes")
        
        return ret
        
    }
}
