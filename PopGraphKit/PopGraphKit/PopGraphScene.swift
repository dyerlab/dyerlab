//
//  PopGraphScene.swift
//  PopGraphKit
//
//  Created by Rodney Dyer on 9/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import SpriteKit

public class PopGraphScene : SKScene {
    
    public var node: PopGraphNode!
    
    public override init(size: CGSize ) {
        let nodeSize = CGSize(width: 30, height: 30)
        self.node = PopGraphNode(color: NSColor.white, size: nodeSize )
        
        node.position.x = size.width/2
        node.position.y = size.height/2
        node.zPosition = 99
        
        
        super.init(size: size)
        
        self.addChild(node)
        self.backgroundColor = NSColor.black

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    public override func sceneDidLoad() {
        print("Hello PopGraphScene::sceneDidLoad")
    }
}
