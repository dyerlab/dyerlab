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
//  MainView
//  MainView.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI



struct LocaleListView: View {
    @State var level: String
    @EnvironmentObject var data: DataSet
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(level)")
                .font(.title)
            List {
                ForEach( data.localesForLevel(level: level), id: \.self ) { locale in
                    
                    NavigationLink(destination: LocaleSummaryView(locale: locale )){
                        VStack(alignment: .leading){
                            Text("\(locale.name)" )
                                .font(.title2 )
                            Text("\(locale.count) individuals")
                                .font(.footnote)
                        }
                    }
                }
            }
        }
        .frame(minWidth: 200, minHeight: 200)
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        LocaleListView( level: "Region")
            .environmentObject( DataSet.defaultDataSet() )
    }
}
