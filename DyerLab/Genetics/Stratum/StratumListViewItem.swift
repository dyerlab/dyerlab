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
//  StratumListViewItem
//  StratumListViewItem.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI

struct StratumListViewItem: View {
    
    @State var stratum: Stratum
    
    var body: some View {
        HStack {
            Image(systemName: "mappin")
            VStack(alignment:.leading) {
                
                    Text("\(stratum.label)")
                        .font(.title3 )
                
                    Text("\(stratum.numIndividuals) samples")
                        .font(.footnote)
            }
        }
        .padding()
        .navigationTitle( stratum.label )
    }
}

struct StratumListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        StratumListViewItem( stratum: Stratum.defaultStratum() )
            
    }
}
