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
//  AlleleFrequencyView.swift
//  DLab
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright © 2021 Rodney J Dyer. All rights reserved.
//

import SwiftUI

struct AlleleFrequencyView: View {
    
    var name: String
    var frequencies: AlleleFrequencies
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(name)
                .font( .largeTitle )
            PieChartView(freqs: frequencies )
        }
        .padding()
        .shadow(radius: 20)
        .cornerRadius(20)
    }
}

struct AlleleFrequencyView_Previews: PreviewProvider {
    static var previews: some View {
        AlleleFrequencyView(name: "TPI",
                            frequencies: AlleleFrequencies.exampleFrequencies() )
            .previewLayout( PreviewLayout.sizeThatFits )
            .frame(width: 500, height: 500, alignment: .center)
            
    }
        
}
