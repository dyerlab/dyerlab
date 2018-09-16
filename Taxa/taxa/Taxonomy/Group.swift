//
//  Group.swift
//  taxa
//
//  Created by Rodney Dyer on 2/26/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

class Group: NSObject {
    var Angiosperms: [Family]
    var Gymnosperms: [Family]
    var Pteridophytes: [Family]
    var Bryophytes: [Family]
    
    override init() {
        Angiosperms = Array<Family>()
        Gymnosperms = Array<Family>()
        Pteridophytes = Array<Family>()
        Bryophytes = Array<Family>()
        super.init()
    }
    
    func addFamily( group: String, name: String ) {
        let fam = Family(name: name)
        
        if group == "Angiosperms" {
            Angiosperms.append( fam )
        } else if group == "Gymnosperms" {
            Gymnosperms.append( fam )
        } else if group == "Pteridophytes" {
            Pteridophytes.append( fam )
        } else if group == "Bryophytes" {
            Bryophytes.append( fam )
        } else {
            print("Error: cannot apply family to group: \(group)")
        }
        
    }
    
    func groupNames() -> [String] {
        return ["Angiosperms", "Gymnosperms", "Pteridophytes", "Bryophytes"]
    }
    
    func familyNames( group: String ) -> [String] {
        if group == "Angiosperms" {
            return Angiosperms.map { $0.name }
        } else if group == "Gymnosperms" {
            return Gymnosperms.map { $0.name }
        } else if group == "Pteridophytes" {
            return Pteridophytes.map { $0.name }
        } else if group == "Bryophytes" {
            return Bryophytes.map { $0.name }
        } else {
            print("Error: cannot apply family to group: \(group)")
            return Array<String>()
        }
    }
    
}
