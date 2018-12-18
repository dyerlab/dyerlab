//
//  CGColor.swift
//  populationgraphs
//
//  Created by Rodney Dyer on 12/7/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public func hexStringToCGColor( hex: String ) -> CGColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return CGColor.init(gray: 0.8, alpha: 1.0)
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return CGColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
