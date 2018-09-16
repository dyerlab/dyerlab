//
//  Matrix.swift
//  MatrixKit
//
//  Created by Rodney Dyer on 9/14/18.
//  Copyright © 2018 Rodney Dyer. All rights reserved.
//

import Foundation

/**
 Produces an Identity Matrix
 
 - Parameters:
    - N: Number of rows and columns
 
 - Returns: A square matrix of zeros except for down the diagonal.
 */
public func IdentityMatrix(_ N: Int) -> Matrix {
    var ret = Matrix(rows: N, cols: N)
    for i in 0..<N {
        ret[i,i] = 1.0
    }
    return ret
}


/**
 The default object for holding `Double` values in matrix format
 
 - Author: Rodney J. Dyer
 */
public struct Matrix {
    
    /// Rows in the matrix
    let rows: Int
    /// Cols in the matrix
    let cols: Int
    /// Values are stored as a `[Double] == Vector`
    var values: Vector
    
    /// Optional value for row names
    public var rowNames: [String]
    
    /// Option value for column names
    public var colNames: [String]
    
    /**
     Init for constant valued matrix.
     
     - Parameters:
        - rows: The number of rows requested.
        - cols: The number of columns in the matrix
        - val: A `Double` value that will be put in each spot (default=0.0).
     
     - Returns: A `Matrix` object with `val` throughout.
     */
    public init(rows: Int, cols: Int, val: Double=0.0) {
        self.rows = rows
        self.rowNames = [String]()
        self.cols = cols
        self.colNames = [String]()
        self.values = Vector(repeating: val, count: rows*cols)
    }
    
    /**
     Init for constant vector of values.
     
     - Parameters:
        - rows: The number of rows requested.
        - cols: The number of columns in the matrix
        - values: A `Vector` of values that will be put in the matrix (`rows*cols` must equal `values.count`).
     
     - Returns: A `Matrix` object with `values` throughout.
     */
    public init( rows: Int, cols: Int, values: Vector ) {
        assert( rows*cols == values.count )
        self.rows = rows
        self.cols = cols
        self.values = values
        self.rowNames = [String]()
        self.colNames = [String]()
    }
    
    func validIndex( row: Int, col: Int ) -> Bool {
        return row>=0 && row < self.rows &&
                col >= 0 && col < self.cols
    }
    
    /**
     Allow subscripting of the Matrix object.  This is a row-major construction.
     
     - Parameters:
        - row: An `Int` for the row index.
        - col: An `Int` for the column Index.
     
     - Returns: The value at `X[row,col]` as a `Double`
     */
    public subscript( row: Int, col: Int ) -> Double {
        
        get{
            assert(validIndex(row: row, col: col))
            return self.values[ (row*cols) + col ]
        }
        set {
            assert( validIndex(row: row, col: col) )
            self.values [ (row*cols) + col ] = newValue
        }
    }
    
    /**
     Row Slice through the matrix.
     
     - Parameters:
        - index: The row index to return.
     
     - Returns: The `index` row of the `Matrix` as a `Vector`
    */
    public func row(_ index: Int) -> Vector {
        assert( validIndex(row: index,col: 0) )
        var ret = Vector( repeating: 0.0, count: self.cols )
        for i in 0..<self.cols {
            ret[i] = self[index,i]
        }
        return ret
    }
    
    
    /**
     Col Slice through the matrix.
     
     - Parameters:
     - index: The col index to return.
     
     - Returns: The `index` col of the `Matrix` as a `Vector`
     */
    public func col(_ index: Int) -> Vector {
        assert( validIndex(row: 0,col: index) )
        var ret = Vector( repeating: 0.0, count: self.cols )
        for i in 0..<self.cols {
            ret[i] = self[i,index]
        }
        return ret
    }
    
}



// MARK: Equatable

extension Matrix : Equatable {
    
    /// Equality operator
    public static func ==( left: Matrix, right: Matrix ) -> Bool {
        assert( left.values.count == right.values.count )
        return left.values == right.values && left.cols == right.cols
    }
    
    /// Inequality operator for two Matrices.
    public static func !=(left: Matrix, right: Matrix ) -> Bool {
        return !(left == right)
    }
    
}


// MARK: Custom String Convertible

extension Matrix: CustomStringConvertible {
    
    /// Overload for printing
    public var description: String {
        get {
            var ret = "\n"
            
            // if present
            if self.cols == self.colNames.count {
                ret += " "
                for name in self.colNames {
                    ret += String(" \(name)")
                }
                ret += String("\n")
            }
            
            for i in 0..<self.rows {
                if self.rowNames.count == self.rows {
                    ret += String(" \(self.rowNames[i])")
                }
                for j in 0..<self.cols {
                    ret += String(" \(self[i,j])" )
                }
                ret += String("\n")
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

public extension Matrix {
    
    /// - Operator
    static func -(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values - right.values
        return ret
    }
    
    /// + Operator for 2 matrices
    static func +(left: Matrix, right: Matrix ) -> Matrix {
        assert( left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values + right.values
        return ret
    }
    
    /// + Operator for Matrix and Double
    static func +( X: Matrix, val: Double ) -> Matrix {
        var ret = X
        ret.values = ret.values + val;
        return ret
    }
    
    /// Kronecker product
    static func •(left: Matrix, right: Matrix ) -> Matrix {
        assert(left.rows == right.rows && left.cols == right.cols, "Non conforming matrices")
        var ret = Matrix(rows: left.rows, cols: left.cols)
        ret.values = left.values * right.values
        return ret
    }
    
    /// Matrix Multipliation
    static func *(left: Matrix, right: Matrix) -> Matrix {
        assert( left.cols == right.rows, "Non conforming matrices")
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
    
    /// Scalar multiplication of Matrix and Double
    static func *( X: Matrix, val: Double ) -> Matrix {
        var ret = X
        ret.values = ret.values * val;
        return ret
    }
    
    /// Scalar division of Matrix and Double
    static func /( X: Matrix, val: Double ) -> Matrix {
        var ret = X
        ret.values = ret.values / val;
        return ret
    }
    
}





