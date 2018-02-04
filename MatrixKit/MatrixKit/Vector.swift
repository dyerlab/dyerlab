//
//  Vector.swift
//  MatrixKit
//
//  Created by Rodney Dyer on 2/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public typealias Vector = [Double]

public func -( left: Vector, right: Vector ) -> Vector {
    let N = left.count
    assert(N == right.count, "Arrays not the same size")
    var ret = Array(repeating:0.0, count:N)
    for i in 0..<N {
        ret[i] = left[i] - right[i]
    }
    return ret
}


public func +( left: Vector, right: Vector ) -> Vector {
    let N = left.count
    assert(N == right.count, "Arrays not the same size")
    var ret = Array(repeating:0.0, count:N)
    for i in 0..<N {
        ret[i] = left[i] + right[i]
    }
    return ret
}


public func *( left: Vector, right: Vector ) -> Vector {
    let N = left.count
    assert(N == right.count, "Arrays not the same size")
    var ret = Array(repeating:0.0, count:N)
    for i in 0..<N {
        ret[i] = left[i] * right[i]
    }
    return ret
}

public func /( left: Vector, right: Vector ) -> Vector {
    let N = left.count
    assert(N == right.count, "Arrays not the same size")
    var ret = Array(repeating:0.0, count:N)
    for i in 0..<N {
        ret[i] = left[i] / right[i]
    }
    return ret
}



