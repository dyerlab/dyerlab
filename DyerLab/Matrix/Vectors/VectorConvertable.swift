//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  
//  VectorConvertable.swift
//  DyerLabKit
//
//  Created by Rodney Dyer on 11/24/20.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.


import Foundation

/// This is a simple protocol that other objects can adopt to be able to generate matrix repsresenations.
public protocol VectorConvertable {
    
    // Any object that adopts this protocol must overload this method
    func asVector() -> Vector
    
}
