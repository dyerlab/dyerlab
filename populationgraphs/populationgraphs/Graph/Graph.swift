//
//  Graph.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/17/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SceneKit

class Graph {
    var nodes = Set<Node>()
    var edges = Set<Edge>()
    var root = SCNNode()
    var temperature: Float = 100.0
    
    init() {
        
    }
    

    func addNode( node: Node ) {
        self.root.addChildNode(node)
        self.nodes.insert(node)
    }
    
    func getNode( label: String ) -> Node? {
        let ret = nodes.filter { $0.label == label }
        return ret.first
    }
    
    func addEdge( edge: Edge ) {
        self.root.addChildNode(edge)
        self.edges.insert(edge)
    }
    
    

}


// MARK: Movement stuff
extension Graph {
    
    
    public func moveAboveFloor() {
//        if nodes.count < 1 { return }
//        
//        var y = nodes.first?.position.y
//        for (i,node) in nodes.enumerated() {
//            if (node.position.y - node.geometry? < y {
//                y = node.position.y
//            }
//        }
//        var (mn, _) = nodeRanges()
//        mn.x = 0
//        mn.z = 0
//        mn.y = mn.y + nodes
//        
//        translateNodes(offset: mn  )
    }
    
    public func translateNodes( offset: SCNVector3 ) {
        let action = SCNAction.moveBy(x: offset.x, y: offset.y, z: offset.z, duration: 1)
        for (_,node) in nodes.enumerated() {
            node.runAction(action)
        }
        for (_,edge) in edges.enumerated() {
            edge.runAction(action)
        }
    }
    
    public func nodeRanges() -> (SCNVector3, SCNVector3) {
        var mn = nodes.first!.position
        var mx = nodes.first!.position

        for (_, node) in self.nodes.enumerated() {
            mn = smallestElements(vec1: mn, vec2: node.position)
            mx = largestElements(vec1: mx, vec2: node.position)
        }
        
        return (mn, mx)
    }
}

// MARK: Stuff for input and output
extension Graph {
    
    
    class func makeLophoGraph() -> Graph {
        let graph = Graph()
        
        
        
        return graph
    }
    
    
    class func importGraphFromJSON(_ path: String ) -> Graph {
        let ret = Graph()
        
        return ret
    }
    
    class func importFromPGraph(_ path: String ) -> Graph? {
        let ret = Graph()
        
        let url = URL(fileURLWithPath: path)
        
        do {
            var contents = try String(contentsOf: url)
            contents = contents.replacingOccurrences(of: "\r", with: "\n")
            contents = contents.replacingOccurrences(of: "\n\n", with: "\n")
            let rows = contents.components(separatedBy: "\n")
            let header = rows[0].components(separatedBy: "\t")
            if header.count == 2 {
                let numNodes = Int(header[0])
                let numEdges = Int(header[1])
                for i in 1 ... numNodes! {
                    let items = rows[i].components(separatedBy: "\t")
                    if items.count == 3 {
                        let size: CGFloat = CGFloat((items[1] as NSString).doubleValue)
                        let node = Node()
                        node.config(size: size, label: items[0])
                        node.diffuseColor = hexStringToCGColor( hex: items[2] )
                        ret.addNode(node: node )
                    }
                }
                
                for i in (numNodes!+1) ..< (numNodes! + numEdges!) {
                    let items = rows[i].components(separatedBy: "\t")
                    if items.count == 3 {
                        let n1 = ret.getNode(label: items[0] )
                        let n2 = ret.getNode(label: items[1] )
                        let wt: CGFloat = CGFloat((items[2] as NSString).doubleValue)
                        let edge = Edge(n1: n1!, n2: n2!, wt: wt)
                        ret.addEdge(edge: edge )
                    }
                }
                
            } else {
                return nil
            }
        }
        catch {
            print( error.localizedDescription )
        }
        
        return ret
    }


    class func makeHumanGraph() -> Graph {
        
        let graph = Graph()
        
        let radii: [CGFloat] = [7.4578942537271, 8.38564840703482, 17.4814077852324,
                                13.9608493006285, 6.38267718725335, 6.30359670547128,
                                12.2073836442719, 8.76782875524144, 11.3159511799494,
                                6.5605345754562, 8.56993864278869, 6.56831052000211,
                                5, 8.44982876540007, 10.6897661741224, 6.91258297698224,
                                13.7358126623227, 7.38152263325782, 8.17514808048328,
                                8.01607626417922, 7.14998264039569, 10.2456363875964,
                                5.22070436753603, 7.69312418487855, 10.3535432085044,
                                5.1339081801508, 8.90296295993226, 9.4661998657112,
                                13.1690196555877]
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
        let coord: [[CGFloat]] = [
            [ -0.6766739 , -0.8305067 , 1.450633 ],
            [ -0.5165526 , -0.9556498 , 0.4778811 ],
            [ 0.5869199 , 1.242157 , 1.015939 ],
            [ 1.521524 , 1.659686 , 0.5823476 ],
            [ -1.266483 , -0.918712 , 1.119679 ],
            [ 0.3073587 , -0.6322796 , 0.6480242 ],
            [ 1.141783 , 1.290574 , 0.5237307 ],
            [ -1.732257 , -0.4747673 , 1.355526 ],
            [ -0.204753 , 0.01207411 , -0.2547184 ],
            [ -0.001407471 , -0.1536686 , -2.006966 ],
            [ -0.1404645 , -0.7241208 , -1.744196 ],
            [ 0.3456565 , -1.032067 , -0.6118357 ],
            [ -1.101811 , -0.8531781 , -0.1180481 ],
            [ 0.3758893 , -0.2692374 , -0.8534264 ],
            [ 1.279122 , 1.92563 , 1.195418 ],
            [ 1.267557 , -0.3953014 , -1.61762 ],
            [ 1.817336 , 1.604236 , 0.07306017 ],
            [ -1.019375 , -0.1426054 , 0.2576206 ],
            [ -1.655719 , -0.3285117 , -0.7927815 ],
            [ -0.2792298 , -1.361604 , 0.649218 ],
            [ -0.6714447 , -1.520904 , 0.755737 ],
            [ 0.5278728 , 0.4712274 , 0.1141108 ],
            [ 0.9437909 , 0.6308882 , -0.8251938 ],
            [ -0.390731 , 0.1872318 , 0.817189 ],
            [ 1.180643 , 1.188513 , 0.004400439 ],
            [ -0.8091868 , -0.5951576 , 0.2113727 ],
            [ -1.131073 , -0.4480152 , -1.976813 ],
            [ -0.7226521 , -0.3322691 , -0.9684026 ],
            [ 1.024361 , 1.756339 , 0.5181143 ]
        ]

        
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
        
        let scaling:CGFloat = 5
        for i in 0..<radii.count {
            let node = Node()
            node.config(size: radii[i]/10.0, label: labels[i])
            node.position = SCNVector3(x: coord[i][0] * scaling, y: coord[i][1] * scaling, z: coord[i][2] * scaling)
            graph.addNode(node: node)
        }
        
        
        
        
        for i in 0..<edges.count {
            let lbl1 = edges[i][0]
            let lbl2 = edges[i][1]
            let n1 = graph.getNode(label: lbl1 )
            let n2 = graph.getNode(label: lbl2 )
            if n1 != nil && n2 != nil {
                let edge = Edge(n1: n1!, n2: n2!, wt: 10.0)
                graph.addEdge(edge: edge)
            }
        }
        
        
        print("Added \(graph.nodes.count) nodes and \(graph.edges.count) edges")
        
        return graph
        
    }
}
