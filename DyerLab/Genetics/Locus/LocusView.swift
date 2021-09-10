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
//  LocusView.swift
//
//  Created by Rodney Dyer on 7/12/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import SwiftUI

struct LocusView: View {
    var locus: Locus
    var editable: Bool = false
    
    var body: some View {
        
        if !editable {
            if locus.isMissing {
                Text("-")
            } else {
                Text( locus.alleles.joined(separator: ":") )
                    .foregroundColor( locus.mask == .Error ? .red.opacity(0.75) :
                                        locus.mask == .None ? .primary :
                                            .secondary)
            }
        }        
        
    }
    
}

struct LocusView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            LocusView( locus: Locus() )
            LocusView( locus: Locus(left: "A", right: "") )
            LocusView( locus: Locus(left: "A", right: "B") )
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Left,
                                                 heterozygote: true,
                                                 masking: true ))
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Right,
                                                 heterozygote: true,
                                                 masking: true ))
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Error,
                                                 heterozygote: true,
                                                 masking: true ))
        }
        .preferredColorScheme( .light )
        .previewLayout( PreviewLayout.sizeThatFits )
        
        
        Group {
            LocusView( locus: Locus() )
            LocusView( locus: Locus(left: "A", right: "") )
            LocusView( locus: Locus(left: "A", right: "B") )
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Left,
                                                 heterozygote: true,
                                                 masking: true ))
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Right,
                                                 heterozygote: true,
                                                 masking: true ))
            LocusView( locus: Locus.exampleLocus(ploidy: .Diploid,
                                                 mask: .Error,
                                                 heterozygote: true,
                                                 masking: true ))
        }
        .preferredColorScheme( .dark )
        .previewLayout( PreviewLayout.sizeThatFits )
        
        
    }
    
}
