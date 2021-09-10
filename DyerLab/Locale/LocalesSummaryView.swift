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
//  LocalesSummaryView
//  LocalesSummaryView.swift
//
//  Created by Rodney Dyer on 9/9/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI

struct LocalesSummaryView: View {
    @State var level: String
    @EnvironmentObject var data: DataSet
    
    var body: some View {
        VStack {
            
            ForEach( data.localesForLevel(level: level), id: \.self) { locale in
                
                LocaleSummaryView(locale: locale)
                
            }
            
            
            
        }
    }
}

struct LocalesSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        LocalesSummaryView(level: "Region")
            .environmentObject( DataSet.defaultDataSet() )
    }
}
