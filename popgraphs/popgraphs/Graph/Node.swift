//
//  Node.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/3/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa
import SpriteKit

class Node: SKSpriteNode {
    
    static let selectNodeNotification = NSNotification.Name("selectNodeNotification")

    var displacement: CGPoint
    let nodeCategoryBitmask: UInt32 = 0x1 << 1
    var edges: [Edge]
    var labelNode: SKLabelNode
    var isSelected: Bool = false
    var degree: Int {
        get {
            return edges.count
        }
    }
    var properties: [String: Any]
    
    init(label: String, size: CGFloat) {
        let texture = SKTexture(imageNamed: "Node")
        self.edges = Array<Edge>()
        self.displacement = CGPoint(x: 0.0, y: 0.0)
        self.labelNode = SKLabelNode(text: label)
        self.labelNode.position = CGPoint(x: size, y: size)
        self.properties = [String:Any]()
        
        super.init( texture: texture, color: NSColor.white, size: texture.size() )
        
        self.name = label
        self.resize(radius: size)
        self.addChild(labelNode)
        self.registerForNotificaitons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func registerForNotificaitons() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.toggleSelection(_:)),
                                               name: Node.selectNodeNotification,
                                               object: nil)
    }
}




// MARK: Movement
extension Node {
    
    func didMove() {
        for edge in edges {
            edge.makePath()
        }
    }
    
    func canMove() -> Bool {
        return self.displacement == CGPoint(x: 0.0, y: 0.0)
    }
    
    
    // TODO: make sure it only is put in places where self and label will
    func randomizeLocation(width: CGFloat, height: CGFloat) {
        let trueBounds = self.calculateAccumulatedFrame()
        let l: CGFloat = 10.0 + trueBounds.size.width / 2.0
        let r: CGFloat = width - 10.0 - trueBounds.size.width / 2.0
        let t: CGFloat = height - 10.0 - trueBounds.size.height / 2.0
        let b: CGFloat = 10.0 + trueBounds.size.height / 2.0
        
        
        self.position = CGPoint(x: CGFloat.random(in: l...r),
                                y: CGFloat.random(in: b...t) )
    }
    
}




// MARK: Appearance
extension Node {
    
    func resize( radius: CGFloat ) {
        self.size = CGSize(width: radius, height: radius)
        
    }
    
    func rescale( scaleFactor: CGFloat ) {
        self.size = CGSize(width: self.size.width * scaleFactor,
                           height:  self.size.height * scaleFactor)
        self.labelNode.position = CGPoint(x: self.size.width, y: self.size.height)
    }
    
    func toggleLabel() {
        if self.children.contains( labelNode ) {
            labelNode.removeFromParent()
        }
        else {
            addChild( labelNode )
        }
    }
    
    
    @objc func toggleSelection(_ notification: Notification ) {
        // not selected but should be cuz' this is your name.
        if !isSelected && self.name == (notification.userInfo!["Name"]) as? String {
            let effectNode = SKEffectNode()
            effectNode.shouldRasterize = true
            let texture = SKTexture(imageNamed: "Node")
            let node = SKSpriteNode(texture: texture )
            node.size = CGSize(width: self.size.width + 5.0, height: self.size.height + 5.0)
            node.zPosition = -1
            effectNode.addChild(node)
            addChild(effectNode)
            effectNode.zPosition = -1
            effectNode.filter = CIFilter(name: "CIGaussianBlur",
                                         parameters: ["inputRadius": 20.0] )
            self.isSelected = true
        }
        
        // currently selected by not receiving notification 
        else if isSelected {
                if let effectNodes = (self.children.filter {$0 is SKEffectNode}) as? [SKEffectNode] {
                    effectNodes.forEach { $0.removeFromParent() }
                }
            self.isSelected = false
        }
    }

    func setProperty( key: String, value: Any ) {
        if key.caseInsensitiveCompare("Longitude") == .orderedSame {
            self.coordinate?.longitude = (value as! CLLocationDegrees)
        } else if key.caseInsensitiveCompare("Latitude") == .orderedSame {
            self.coordinate?.latitude = (value as! CLLocationDegrees)
        } else if key.caseInsensitiveCompare("Color") == .orderedSame {
            if let hex = value as? String {
                let colorizeAction = SKAction.colorize(with: hex2NSColor(hex: hex),
                                                       colorBlendFactor: 0.75,
                                                       duration: 5)
                self.run(colorizeAction)
            }
        }
        else {
            self.properties[key] = value
        }
    }
}


// Mark: Overload for CustomStringConvertible
extension  Node  {
    
    override var description: String {
        var ret = "Node: \(self.name ?? "node")\n"
        ret += super.description + "\n"
        ret += "degree: \(degree)\n"
        for property in properties.keys {
            ret += "\(property): \(self.properties[property] ?? "nil")\n"
        }
        return ret
    }
    
}



// MARK: Mapkit Integration
import MapKit

extension Node : Mappable {
    
    var coordinate: CLLocationCoordinate2D? {
        get {
            if !self.properties.keys.contains("Coordinate") {
                self.properties["Coordinate"] = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
            }
            return self.properties["Coordinate"] as? CLLocationCoordinate2D
        }
        set {
            self.properties["Coordinate"] = newValue
        }
    }

    
}
