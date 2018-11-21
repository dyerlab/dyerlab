//
//  CGFloat.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 11/21/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation


extension CGFloat {
    
    public static func deg2rad(_ deg: CGFloat ) -> CGFloat {
        return deg * CGFloat.pi / 180.0
    }
    
}
