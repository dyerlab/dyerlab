//                      _                 _       _
//                   __| |_   _  ___ _ __| | __ _| |__
//                  / _` | | | |/ _ \ '__| |/ _` | '_ \
//                 | (_| | |_| |  __/ |  | | (_| | |_) |
//                  \__,_|\__, |\___|_|  |_|\__,_|_.__/
//                        |_ _/
//
//         Making Population Genetic Software That Doesn't Suck
//
//  TestMatrix.swift
//
//
//  Created by Rodney Dyer on 6/10/21.
//  Copyright (c) 2021 The Dyer Laboratory.  All Rights Reserved.


import XCTest

final class AlgebraTests: XCTestCase {
    
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
    }
    
    func testGInv() throws {
        let A = Matrix( 2, 3, [1.0, 2.0 , 3.0 , 4.0 , 5.0 ,6.0 ] )
        let ATA = A .* A.transpose
        XCTAssertEqual( ATA, Matrix( 2, 2, [14,32,32,77]))
        let ATAInv = ginv(ATA)
        
        var ATAInvExp = Matrix( 2,2, [77,-32,-32,14])
        ATAInvExp = ATAInvExp * (1.0 / 54.0 )
        XCTAssertEqual( ATAInv, ATAInvExp )
    }
 
    func testSVD() throws {
        let A = Matrix( 2, 3, [3.0, 2.0, 2.0, 2.0, 3.0, -2.0 ] )
        guard let svdA = svd( A ) else { return }
        XCTAssertTrue( svdA.d.count == 2 )
        let eig1 = svdA.d[0] - 5.0
        let eig2 = svdA.d[1] - 3.0
        XCTAssertTrue( eig1 < 0.0000000000001 )
        XCTAssertTrue( eig2 < 0.0000000000001 )
        
        XCTAssertTrue( svdA.U.rows == 2 )
        XCTAssertTrue( svdA.U.cols == 2 )
    }
    
    
    func testPCA() throws {
        let A = Matrix( 2, 3, [3.0, 2.0, 2.0, 2.0, 3.0, -2.0 ] )
        
        guard let pca = PCA( A ) else { return }
        
        XCTAssertEqual( pca.d[0], 3.0 )
        XCTAssertTrue( pca.d[1] < 2e-10 )
        
        
    }

     
}
     


