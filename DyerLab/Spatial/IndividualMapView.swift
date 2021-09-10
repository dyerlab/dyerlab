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
//  IndividualMap
//  IndividualMap.swift
//
//  Created by Rodney Dyer on 9/2/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI
import MapKit

struct IndividualMapView: View {
    
    @State var region: MKCoordinateRegion
    
    var annotationItems: [Place]
    
    var body: some View {
        Map( coordinateRegion: $region,
             interactionModes: .all,
             showsUserLocation: true,
             annotationItems: annotationItems) { item in
            MapMarker(coordinate: item.coordinate)
        }
             .edgesIgnoringSafeArea(.all )
    }
}

struct IndividualMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        IndividualMapView(region: Individual.exampleIndividual().region ,
                          annotationItems: [Individual.exampleIndividual().place] )
                        .previewLayout( PreviewLayout.sizeThatFits )
    }
    
}
