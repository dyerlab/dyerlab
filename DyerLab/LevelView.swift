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
//  ListView
//  ListView.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject var data: DataSet
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Data")
                .padding(.all, 5)
                .font(.headline)
            
            List {
                ForEach( data.levels, id: \.self) { level in
                    
                    if level == "All" {
                        NavigationLink(String("\(level)"), destination: {
                            LocaleSummaryView(locale: data.localeNamed(name: "All"))
                        })
                    } else {
                        NavigationLink(String("\(level)"), destination: {
                            LocaleListView(level: level)
                        })
                    }
                    
                    
                }
            }


        }
        .listStyle(SidebarListStyle())

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
            .environmentObject( DataSet.defaultDataSet() )
    }
}
