//
//  BigONotationTests.swift
//  BigONotationTests
//
//  Created by Spandana Batchu on 17/10/19.
//  Copyright © 2019 Spandana Batchu. All rights reserved.
//

import XCTest
@testable import BigONotation

class BigONotationTests: XCTestCase {

    let manager = PurchaseManager()
    

    func test1One() {
        // This is an example of a performance test case.
        self.measure {
            manager.purchaseAllItems1()
        }
    }
    
    func test2Two() {
        self.measure {
            manager.purchaseAllItems2()
        }
    }


}
