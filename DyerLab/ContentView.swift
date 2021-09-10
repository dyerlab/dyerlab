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
//  DyerLab
//  ContentView.swift
//
//  Created by Rodney Dyer on 9/7/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI

// https://swiftwithmajid.com


struct ContentView: View {
    
    @StateObject var data = DataSet.defaultDataSet()
    
    var body: some View {
        
        NavigationView {
            
            
            LevelView()
            
            
        }
        .environmentObject( data )
        .frame(minWidth: 600, minHeight: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
