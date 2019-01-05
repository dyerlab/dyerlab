//
//  SidebarItem.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa


class OutlineItem: NSObject {
    let title: String
    var properties: [String:String] = [:]
    
    init( title: String ) {
        self.title = title
    }
}
