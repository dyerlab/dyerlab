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
//  DLab
//  IndividualView.swift
//
//  Created by Rodney Dyer on 7/13/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI

struct IndividualView: View {
    @State private var mapPopup = false
    @State private var idPopup = false
    
    var individual: Individual
    
    var body: some View {

        Text("Hello World!")
        
        
        /*
        ZStack {
            VStack(alignment: .leading ) {
                HStack {
                    Button(action: {
                        idPopup = true
                    }, label: {
                        Image(systemName: "i.circle")
                    })
                    Button( action: {
                        mapPopup = true
                    }, label: {
                        Image(systemName: "mappin.circle")
                    })
                    
                    ForEach( ind.locusNames, id: \.self ) { name in
                        LocusView(locus: ind.getLocus(name: name ))
                            .frame(width: 40, alignment: .center)
                    }
                }
            }
            if $idPopup.wrappedValue {
                idViewPopup()
            }
            if $mapPopup.wrappedValue {
                mapViewPopup()
            }
        }
         */
    }
    
    
    /*
    private func mapViewPopup() -> some View {
        VStack {
            //MapView(region: ind.region, mapType: [ind.place])
            Button(action: {
                withAnimation {
                    self.mapPopup = false
                }
            }, label: {
                Text("Close")
            })
        }
        .padding()
        .frame(width: 240, height: 400, alignment: .center)
        .background( Color.primary.colorInvert())
        .cornerRadius( 20 )
        .shadow(radius: 20)

    }
    
    
    private func idViewPopup() -> some View {
        
        VStack {
            Text(String("ID: \(ind.id.description)"))
                .font( .caption )
            Button(action: {
                withAnimation {
                    self.idPopup = false
                }
            }, label: {
                Text("Close")
            })
        }
        .padding()
        .background( Color.primary.colorInvert()  )
        .cornerRadius( 20 )
        .shadow(radius: 20)
        
    }
    */
    
    
    
    
}

struct IndividualView_Previews: PreviewProvider {
    static var previews: some View {
        
        IndividualView(individual: Individual.exampleIndividual() )
            .preferredColorScheme( .light )
            .previewLayout( PreviewLayout.sizeThatFits )
        
        IndividualView(individual: Individual.exampleIndividual() )
            .preferredColorScheme( .dark )
            .previewLayout( PreviewLayout.sizeThatFits )
            
    }
}
