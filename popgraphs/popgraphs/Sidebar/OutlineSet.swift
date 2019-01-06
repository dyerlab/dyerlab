//
//  OutlineSet.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/6/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

class OutlineSet: NSObject {
    let name: String
    var children: [OutlineItem] = []
    override var description: String {
        var ret = "\(self.name): \n"
        for child in self.children {
            ret += "\(child.description) \n"
        }
        return ret
    }

    
    init( name: String ) {
        self.name = name
    }
    
}


