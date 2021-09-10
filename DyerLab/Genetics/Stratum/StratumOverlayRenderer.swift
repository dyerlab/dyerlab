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
//  StratumOverlayRenderer
//  StratumOverlayRenderer.swift
//
//  Created by Rodney Dyer on 8/31/21.
//  Copyright (c) 2021 Rodney J Dyer.  All Rights Reserved.
//

import MapKit


/*

class StratumOverlayRenderer: MKOverlayRenderer {

    let overlayImage: NSImage
    
    
    init(overlay: MKOverlay, overlayImage: NSImage) {
        self.overlayImage = overlayImage
        super.init( overlay: overlay )
    }
    
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        let imageReference = overlayImage.cgImage
        let rect = self.rect(for: overlay.boundingMapRect )
        context.scaleBy(x: 1.0, y: -1.0)
        context.translateBy(x: 0.0, y: -rect.size.height )
        
        context.draw(imageReference!, in: rect)
    }
    
}

*/
