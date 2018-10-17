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



extension NSView {
    
    class func fromNib<T: NSView>() -> T? {
        var viewArray : NSArray? = NSArray()
        guard Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, topLevelObjects: &viewArray) else {
            return nil
        }
        return viewArray!.first(where: {$0 is T}) as? T
    }
}
