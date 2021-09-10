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
//  LocaleSummaryView
//  LocaleSummaryView.swift
//
//  Created by Rodney Dyer on 9/8/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI
import MapKit

struct LocaleSummaryView: View {
    @State var locale: Locale
    
    @State private var genotypesExpanded = false
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
//              Map(coordinateRegion: locale.region)
//                MapView(region: locale.region, mapType: .satellite)
                
                HStack(alignment: .center,spacing: 15.0) {
                    Text("\(locale.name)")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading){
                        Text("Individuals: \(locale.count)")
                        Text("Loci: \(locale.individuals.first?.locusNames.count ?? 0)")
                        Text("Summaries:")
                        Text("  • Ho = \(String(format: "%.4f", locale.frequencies.meanHo))")
                        Text("  • He = \(String(format: "%.4f", locale.frequencies.meanHe))")
                        Text("  • Fis = \(String(format: "%.4f", locale.frequencies.meanFis))")
                    }
                }
                
                Text("Genotypes")
                    .font(.title2 )
                    .padding()
                
                IndividualListView(individuals: locale.individuals)
                    
                
            }
        }
    }
}

struct LocaleSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        LocaleSummaryView(locale: DataSet.defaultDataSet().locales["Const"]!)
            
    }
}
