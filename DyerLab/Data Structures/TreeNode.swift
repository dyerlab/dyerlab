//
//  dyerlab.org                                          @dyerlab
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//  DLab
//  TreeNode.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation



/// A general node level object for a tree structure.
public class TreeNode<T: Equatable>: Equatable  {
    
    /// Label for level in tree
    public var label: String
    
    
    /// The data object inside the node.
    public var value: T
    
    /// Parent node t
    public weak var parent: TreeNode?
    
    /// Array of children plot
    public var children = [TreeNode<T>]()
    
    /// Default Initializer
    public init( value: T, label: String  ) {
        self.value = value
        self.label = label
    }
    
    /// Easily add child to this
    public func addChild(_ node: TreeNode<T>) {
        children.append( node )
        node.parent = self
    }
    
    
    
    
    /// Equatable stub
    public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.value == rhs.value && lhs.children == rhs.children
    }

}






extension TreeNode: CustomStringConvertible {
    
    /// Overload of the class to be able to be printed.  This assumes that T is also overloaded
    public var description: String {
        var ret = "\(value)"
        if !children.isEmpty {
            ret += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        return ret 
    }
    
}


