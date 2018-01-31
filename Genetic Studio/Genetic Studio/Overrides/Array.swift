//
//  Array.swift
//  Genetic Studio
//
//  Created by Rodney Dyer on 1/30/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

extension Array {
    
    func randomElement() -> Element? {
        if isEmpty {
            return nil
        }
        let idx = Int(arc4random_uniform(UInt32(self.count)))
        return self[idx]
    }
    
}
