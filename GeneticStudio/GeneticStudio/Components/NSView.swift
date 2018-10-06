//
//  NSView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/5/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Cocoa

extension NSView {
    
    var backgroundColor: NSColor? {
        get {
            guard let color = layer?.backgroundColor else { return nil }
            return NSColor(cgColor: color)
        }
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
