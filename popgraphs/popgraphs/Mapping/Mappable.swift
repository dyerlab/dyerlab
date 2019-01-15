//
//  Mappable.swift
//  popgraphs
//
//  Created by Rodney Dyer on 1/9/19.
//  Copyright © 2019 Rodney Dyer. All rights reserved.
//

import Foundation
import MapKit

protocol Mappable {
    var coordinate: CLLocationCoordinate2D? { get set }
}
