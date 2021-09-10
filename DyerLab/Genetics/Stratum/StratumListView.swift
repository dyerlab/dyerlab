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
//  StratumListView
//  StratumListView.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI

struct StratumListView: View {
    
    @EnvironmentObject var data: DataSet
    
    var body: some View {
        VStack {
            List {
                StratumListViewItem(stratum: data.strata )
                ForEach( data.strata.substrata ){ stratum in
                    StratumListViewItem(stratum: stratum )
                }
            }
        }
    }
}


struct StratumListView_Previews: PreviewProvider {
    static var previews: some View {
        StratumListView()
            .environmentObject( DataSet.defaultDataSet() )
    }
}
 
