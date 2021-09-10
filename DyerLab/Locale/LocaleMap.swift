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
//  LocaleMap
//  LocaleMap.swift
//
//  Created by Rodney Dyer on 9/9/21.
//  Copyright (c) 2021 Rodney J. Dyer.  All Rights Reserved.
//

import SwiftUI
import MapKit

struct LocaleMap: View {
    @State var locale: Locale
    @State private var mapType: MKMapType = .satellite
    
    var body: some View {
    
        ZStack {
            
            MapView(region: locale.region, mapType: mapType )
            VStack {
                Spacer()
                
                Picker("", selection: $mapType) {
                    Text("Standard").tag(MKMapType.standard)
                    Text("Satellite").tag(MKMapType.satellite)
                    Text("Hybrid").tag(MKMapType.hybrid)
                }
                .pickerStyle( SegmentedPickerStyle())
                .offset(y: -40)
                .font(.largeTitle)
            }
        }
        
        
    }
}

struct LocaleMap_Previews: PreviewProvider {
    static var previews: some View {
        LocaleMap( locale: DataSet.defaultDataSet().localeNamed(name: "Const") )
    }
}
