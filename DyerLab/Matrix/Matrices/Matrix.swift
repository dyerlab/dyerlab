//
//  Matrix.swift
//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
// 
//
//  Created by Rodney Dyer on 6/10/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.


import Foundation
import Accelerate



/// The base Matrix Class
///
/// This is the base class for 2-dimensinoal matrix data.  It is defined as a row-major matrix and is configured
///  internally to use the `Accelerate` library for
public class Matrix {
    
    
    /// The storage for the values in the matrix
    public var values: Vector
    
    /// The number of rows in the matrix
    public var rows: Int = 0
    
    /// The number of columns in the matrix
    public var cols: Int = 0
    
    /// The Row Cames
    public var rowNames: [String]?
    
    /// The Column Names
    public var colNames: [String]?
    
    /// Grab the diagonal of the matrix
    public var diagonal: Vector {
        get {
            let mn = min( rows, cols)
            var ret = Vector(repeating: .nan, count: mn)
            for i in 0 ..< mn {
                ret[i] = values[ (i * cols ) + i ]
            }
            return ret
        }
        set {
            let mx = min( min( self.rows, self.cols), newValue.count )
            for i in 0 ..< mx {
                self[i,i] = newValue[i]
            }
        }
    }
    
    /// Matrix Trace
    public var trace: Double {
        get {
            return self.diagonal.sum
        }
    }
    
    /// Grab the sum of the entire matrix
    public var sum: Double {
        get {
            return self.values.sum
        }
    }
    
    /// Return the sum of the rows
    public var rowSum: Vector {
        get {
            let ones = Matrix(cols, 1, 1.0 )
            let V = self .* ones
            return V.values
        }
    }
    
    /// Returns sum of columns
    public var colSum: Vector {
        get {
            let ones = Matrix(1, rows, 1.0 )
            let V = ones .* self
            return V.values
        }
    }


    /// The tanspose of the matrix
    public var transpose: Matrix {
        get {
            let ret = Matrix( cols, rows, 0.0)
            vDSP_mtransD( values, 1, &ret.values, 1, vDSP_Length(cols), vDSP_Length(rows) )
            return ret
        }
    }

    
    
    /// Overload of the subscript operator
    ///
    /// This assumes that the matrix is row-major and starts with 0.
    /// - Parameters:
    ///  - r: The row
    ///  - c: The column
    ///  - Returns: If asking for it, this returns the value at the requested indices.
    public subscript(_ r: Int, _ c: Int) -> Double {
        get {
            if !areValidIndices(r, c) {
                return .nan
            }
            
            return values[ (r * cols) + c ]
            
        }
        set {
            if areValidIndices( r, c) {
                values[ (r * cols)+c ] = newValue
            }
        }
    }
    
    /// Default Intitializer for matrix
    ///
    /// This initializer makes an empty matrix with specified number of rows and columns
    /// - Parameters:
    ///   - r: The number of Rows
    ///   - c: The number of Columns
    ///   - value: The value to populate the matrix with (default=0.0)
    public init(_ r: Int, _ c: Int, _ value: Double = 0.0 ) {
        values  = Vector(repeating: value, count: r*c)
        rows = r
        cols = c
    }
    
    /// Intitializer for matrix based upon vector of values
    ///
    /// This initializer makes an empty matrix with specified number of rows and columns.  This fills the matrix up **by row**
    ///  and not by columns.  If you want **bycol** then you must manually **transpose** the result.
    /// - Parameters:
    ///   - r: The number of Rows
    ///   - c: The number of Columns
    ///   - values: The value to populate the matrix with (default=0.0)
    public init(_ r: Int, _ c: Int, _ vec: Vector) {
        if vec.count == 0 || r*c != vec.count {
            rows = 0
            cols = 0
            values = [Double]()
        } else  {
            self.values = vec
            self.rows = r
            self.cols = c
        }
    }
    
    public init(_ r: Int, _ c: Int, _ seq: ClosedRange<Double>) {
        let steps = Double(r * c) - 1.0
        let unit = (seq.upperBound - seq.lowerBound) / steps
        let vec = Array(stride(from: seq.lowerBound,
                               through: seq.upperBound,
                               by: unit))
        
        rows = r
        cols = c
        values = vec
        
    }
    
    
    /// An internal function to check the indices to see if they will work properly
    internal func areValidIndices(_ r: Int, _ c: Int ) -> Bool {
        return r >= 0 && c >= 0 && r < rows && c < cols
    }
    
}


// MARK: - Protocols

extension Matrix: Equatable {
    
    /// Equality Operator overload
    /// - Parameters:
    ///   - lhs: The left matrix
    ///   - rhs: The right matrix
    /// - Returns: Returns a `Bool` indicating element-wise equality and shape of the two matrices
    public static func ==(lhs: Matrix, rhs: Matrix) -> Bool {
        return lhs.values == rhs.values && lhs.rows == rhs.rows && lhs.cols == rhs.cols
    }
}



/// Conforms to the Printing Protocol
extension Matrix: CustomStringConvertible {
    public var description: String {
        var ret = String( "Matrix: (\(rows) x \(cols))")
        ret += "\n[\n"
        
        for r in 0 ..< rows {
            for c in 0 ..< cols {
                ret += String( " \(values[ (r*cols)+c])" )
            }
            ret += "\n"
        }
        ret += "]\n"
        return ret
    }
}







// MARK: - Algebraic Operations

extension Matrix {
    
    
    




    
    public func center()  {
        let µ = self.colSum / Double( self.rows )
        for i in 0..<rows {
            for j in 0..<cols {
                self[i,j] = self[i,j] - µ[j]
            }
        }
        
    }
    
    
    public func submatrix(_ r: [Int], _ c: [Int] ) -> Matrix {
        let ret = Matrix(r.count, c.count, 0.0 )
        for i in 0..<r.count {
            for j in 0..<c.count {
                ret[i,j] = self[ r[i], c[j] ]
            }
        }
        return ret
    }
    

    
}
