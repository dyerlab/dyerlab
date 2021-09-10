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
//  StratumSummary
//  StratumSummary.swift
//
//  Created by Rodney Dyer on 8/20/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI

struct StratumSummaryView: View {
    
    var stratum: Stratum
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text( "\(stratum.label)")
                .font(.largeTitle)
            
            Text("\(stratum.allIndividuals.count) Individuals:")
                .font(.title3)
            
            
            ForEach( stratum.allIndividuals, id: \.self ) { individual in
                IndividualView(ind: individual )
            }
            
        }
    }
}

struct StratumSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StratumSummaryView( stratum: Stratum.defaultStratum() )
            .previewLayout( PreviewLayout.sizeThatFits )
    }
}
