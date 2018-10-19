//
//  NSTableView.swift
//  GeneticStudio
//
//  Created by Rodney Dyer on 10/18/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import Cocoa

extension NSTableView {
    
    public func makeBackgroundTranslucent() { 
        self.layer?.backgroundColor = CGColor.clear
        self.enclosingScrollView!.layer?.backgroundColor = CGColor.clear
        self.enclosingScrollView!.borderType = .noBorder
        self.enclosingScrollView!.drawsBackground = false
        
    }
}
