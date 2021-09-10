//
//  TestMatrixAlgebra.swift
//  DLabMatrixTests
//
//  Created by Rodney Dyer on 7/2/21.
//

import XCTest

class TestMatrixAlgebra: XCTestCase {

    func testAlgebra() throws {
        let A = Matrix( 2, 2, [-1, 3.0/2.0, 1, -1] )
        let B = Matrix( 2, 2, [-1, 3.0/2.0, 2.0/3.0, -1] )
        let C = Matrix( 2, 3, [1, 2, 3, 4, 5, 6] )
        
        let Ainv = ginv( A )
        let Binv = ginv( B )
        let Cinv = ginv( C )
        
        XCTAssertEqual( Ainv.rows, 2 )
        XCTAssertEqual( Ainv.cols, 2 )
        XCTAssertEqual( Binv.rows, 0 )
        XCTAssertEqual( Binv.cols, 0 )
        XCTAssertEqual( Cinv.rows, 0 )
        XCTAssertEqual( Cinv.cols, 0 )
        
        let svdA = svd( A )
        XCTAssertEqual( svdA!.d.count, 2 )
        XCTAssertEqual( svdA!.U.rows, 2 )
        XCTAssertEqual( svdA!.U.cols, 2 )
        XCTAssertEqual( svdA!.V.rows, 2 )
        XCTAssertEqual( svdA!.V.cols, 2 )

        let diagD = Matrix(2,2)
        diagD.diagonal = svdA!.d
        
        let Ap = svdA!.U .* diagD .* svdA!.V.transpose
        let diff = Ap.values - A.values
        XCTAssertTrue( abs(diff.sum) < 1e-10 )
        
        var I = svdA!.U .* svdA!.U.transpose
        XCTAssertEqual( I.rows, 2 )
        XCTAssertEqual( I.cols, 2 )
        XCTAssertTrue( abs( I.sum - 2.0 ) < 1e-10 )
        
        I = svdA!.V .* svdA!.V.transpose
        XCTAssertEqual( I.rows, 2 )
        XCTAssertEqual( I.cols, 2 )
        XCTAssertTrue( abs( I.sum - 2.0 ) < 1e-10 )
        
        XCTAssertTrue( RangeEnum.uniform_0_1 < RangeEnum.normal_0_1 )
        
    }

}
