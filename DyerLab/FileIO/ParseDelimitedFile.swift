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
//  ParseDelimitedFile.swift
//
//  Created by Rodney Dyer on 7/19/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import Foundation

/**
 Parse delimited file into [[String]] object.
 
 This function is a basic interface for loading in textual data that exists in a column separted context.
 
 - Parameter path: String representing path to the file
 - Parameter delimiter: String object to separate columns from each row.
 
 - Returns: An array of string array objects.
 */
public func parseDelimitedFile(path: String, delimiter: String) -> [[String]]? {
    let url = URL(fileURLWithPath: path)
    let contents: String
    var lines = [String]()
    var data = [[String]]()
    
    do {
        contents = try String(contentsOf: url)
        lines = contents.components(separatedBy: "\n")
    } catch {
        print( error.localizedDescription )
    }
    
    data.reserveCapacity(lines.count)
    for line in lines {
        let cleanline = line.trimmingCharacters(in: CharacterSet.newlines)
        if cleanline.contains(delimiter) {
            data.append( cleanline.components(separatedBy: delimiter) )
        }
    }
    return data
}

