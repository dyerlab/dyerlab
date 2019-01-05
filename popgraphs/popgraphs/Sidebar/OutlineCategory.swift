//
//  SidebarCategory.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/4/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Cocoa

class OutlineCategory: NSObject {
    let name: String
    var children: [OutlineItem] = []
    
    init( name: String ) {
        self.name = name
    }
}


class OutlineSet: NSObject {
    let name: String
    var children: [OutlineItem] = []
    
    init( name: String ) {
        self.name = name
    }
    
}
