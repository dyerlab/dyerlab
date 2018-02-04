//
//  Matrix.swift
//  MatrixKit
//
//  Created by Rodney Dyer on 2/4/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

public struct Matrix {
    public let rows: Int
    public let cols: Int
    var values: Vector
    
    public init( rows: Int, cols: Int, val: Double = 0.0 ) {
        self.rows = rows
        self.cols = cols
        self.values = Array(repeating: val, count: rows*cols)
    }
    
    func validIndex( row: Int, col: Int ) -> Bool {
        return row >= 0 &&
                row < self.rows &&
                col >= 0 &&
                col < self.cols
    }
    
    public subscript( row: Int, col: Int ) -> Double {
        get {
            assert(validIndex(row: row, col: col), "Index out of Range")
            return self.values[ (row*cols) + col ]
        }
        set {
            assert(validIndex(row: row, col: col), "Index out of Range")
            self.values[ (row*cols) + col ] = newValue
        }
    }
    
    public func row(_ index: Int) -> Vector {
        assert(validIndex(row: index, col: 0), "Index out of range")
        var ret = Vector(repeatElement(0, count: self.cols))
        var i=0
        for col in 0..<self.cols {
            ret[i] = self[index,col]
            i = i + 1
        }
        return ret
    }
    
    public func col(_ index: Int) -> Vector {
        assert(validIndex(row: 0, col: index), "Index out of range")
        var ret = Vector( repeatElement(0, count: self.rows))
        var i = 0
        for row in 0..<self.rows {
            ret[i] = self[row,index]
            i = i + 1
        }
        return ret
    }
    
    public func diagonal() -> Vector {
        assert( rows == cols, "Only applicable to square matrices at this time")
        var ret = Vector(repeating:0.0, count:self.rows)
        for i in 0..<rows {
            ret[i] = self[i,i]
        }
        return ret
    }
}


extension Matrix: Equatable {
    
    public static func ==(left: Matrix, right: Matrix ) -> Bool {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        return left.values == right.values &&
                left.rows == right.rows &&
                left.cols == right.cols
    }
    
    public static func !=(left: Matrix, right: Matrix ) -> Bool {
        return !(left == right)
    }
    
}

extension Matrix: CustomStringConvertible {
    
    public var description: String {
        get {
            var ret = "\n"
            for i in 0..<self.rows {
                for j in 0..<self.cols {
                    ret += String(" \(self[i,j])")
                }
                ret += "\n"
            }
            return ret
        }
    }
    
}


// MARK: Math operators

infix operator •: MultiplicationPrecedence
precedencegroup MultiplicationPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}


extension Matrix {
    
    public static func -(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values - right.values
        return ret
    }
    
    public static func +(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values + right.values
        return ret
    }
    
    // Kronecker product
    public static func •(left: Matrix, right: Matrix ) -> Matrix {
        assert(left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values * right.values
        return ret
    }
    
    // Matrix Multipliation
    public static func *(left: Matrix, right: Matrix) -> Matrix {
        assert( left.rows == right.cols && left.cols == right.rows, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: right.cols )
        for i in 0..<ret.rows {
            let r = left.row(i)
            for j in 0..<ret.cols {
                let c = right.col(j)
                ret[i,j] =  (r * c).reduce(0,+)
            }
        }
        return ret
    }

}
