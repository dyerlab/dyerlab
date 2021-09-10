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
//  IndividualListView
//  IndividualListView.swift
//
//  Created by Rodney Dyer on 9/9/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI

struct IndividualListView: View {
    @State var individuals: [Individual]
    
    var body: some View {
        
            LazyVGrid( columns: makeGrid(), spacing: 20 ) {
                ForEach(individuals, id: \.self){ individual in
                    ForEach(individual.locusNames, id: \.self) { name in
                        LocusView( locus: individual.getLocus(name: name))
                            .background( Color.gray )
                    }
                }
            }
        
    }
    
    
    private func makeGrid() -> [GridItem] {
        
        var ret = [GridItem]()
        
        if individuals.count > 0 {
            for _ in individuals[0].locusNames {
                ret.append( GridItem( .fixed(50) ) )
            }
        }
        
        return ret
    }
}

struct IndividualListView_Previews: PreviewProvider {
    static var previews: some View {
        IndividualListView(individuals: Locale.defaultLocale().individuals )
    }
}
