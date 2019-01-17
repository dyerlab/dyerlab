//
//  Array.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
    func difference(from other: [Element] ) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array( thisSet.symmetricDifference(otherSet) )
    }
    
}



