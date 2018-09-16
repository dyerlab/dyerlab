//
//  TableViewVC.swift
//  taxa
//
//  Created by Rodney Dyer on 2/24/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation
import UIKit

enum TaxonomicListLevel {
    case OrderLevel
    case FamilyLevel
    case SpeciesLevel
}

class TaxonomicTableVC: UITableViewController {
    
    var data: Group = Group()
    var currentLevel: TaxonomicListLevel = .OrderLevel
    var currentEntries = Array<String>()
    
    @IBAction func onAddEntry(_ sender: AnyObject ) {
        print("onAddEntry")
    }
    
    override func viewDidLoad() {
        
        guard let path = Bundle.main.path(forResource: "Taxonomy", ofType: "txt") else { return }
        do {
            let contents = try String.init(contentsOfFile: path, encoding: String.Encoding.utf8)
            let lines = contents.components(separatedBy: "\n")
            var currentGroup = ""
            for line in lines {
                let parts = line.components(separatedBy: "\t")
                if parts.count == 1 { // group.
                    currentGroup = parts[0]
                }
                else if parts.count == 2 {
                    data.addFamily(group: currentGroup, name: parts[1] )
                }
            }
            
            // Set up the initial values
            currentLevel = .OrderLevel
            currentEntries = data.groupNames()
            
        } catch {
            print("there was an error")
            return
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        
        
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if currentLevel == .OrderLevel {
            print("order level")
            self.currentLevel = .FamilyLevel
        }
        if currentLevel == .SpeciesLevel {
            print("selected species")
            let vc = storyboard?.instantiateViewController(withIdentifier: "SpeciesInfoViewController") as! SpeciesVC
            vc.taxa = currentEntries[ indexPath.row ]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }


}
