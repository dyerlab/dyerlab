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
//  EquallySpacedColor.swift
//
//  Created by Rodney Dyer on 3/24/21.
//


import SwiftUI



extension Color {
    
    static func getSpacedColor(index: Int, of: Int, saturation: Double = 0.5, brightness: Double = 0.95 ) -> Color {
        let hue = Double(index) * (1.0 / Double(of))
        return Color(hue: hue, saturation: saturation , brightness: brightness )
    }
    
    static func random() -> Color {
        return Color(
            red:   .random( in: 0...1.0 ),
            green: .random( in: 0...1.0 ),
            blue:  .random( in: 0...1.0 )
        )
    }
    
    static func hslColor( number: Int, of: Int ) -> Color {
        return Color.init(hue: Double(number)/Double(of), saturation: 2.0/3.0, brightness: 2.0/3.0)
    }
    
    
    static func getColorRange(numColors: Int, saturation: Double = 1.0, brightness: Double = 1 ) -> [Color] {
        var ret = [Color]()
        for i in 0 ..< numColors {
            ret.append( Color.getSpacedColor(index: i, of: numColors,saturation: saturation, brightness: brightness ) )
        }
        
        return ret
    }
    
    static func getColorsForFrequencies( freqs: [Double] ) -> [Color] {
        var ret = [Color]()
        var ctr = 0.0
        
        for i in 0 ..< freqs.count {
            let val = ctr + freqs[i]/2.0
            ret.append( Color(hue: val,
                              saturation: 0.7,
                              brightness: 1.0))
            ctr += freqs[i]
        }
        return ret
    }
    
    static func getNColors( N: Int, saturation: Double = 0.5, brightness: Double = 0.95 ) -> [Color] {
        var ret = [Color]()
        for i in 0 ..< N {
            ret.append( getSpacedColor(index: i, of: N, saturation: saturation, brightness: brightness ) )
        }
        return ret
    }
    
}
