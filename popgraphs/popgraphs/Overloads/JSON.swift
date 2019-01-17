//
//  JSON.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/17/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation

func readInJSON( path: String ) -> [String:Any]?  {
    
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let array = try JSONSerialization.jsonObject(with: data,
                                                     options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
        return array!
    } catch {
        print("Error caught")
    }
    return nil
}


