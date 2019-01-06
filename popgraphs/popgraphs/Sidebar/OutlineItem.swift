//
//  SidebarItem.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa


enum OutlineItemType {
    case node
    case edge
}

class OutlineItem: NSObject {
    let title: String
    var properties: [String:String] = [:]
    var type: OutlineItemType
    override var description: String {
        var ret = "\(self.title): \n"
        for (key,val) in properties.enumerated() {
            ret += "\(key): \(val)\n"
        }
        return ret
    }

    
    init( title: String, type: OutlineItemType ) {
        self.title = title
        self.type = type
    }
}


