//
//  Purchase.swift
//  NotationPerformance
//
//  Created by Spandana Batchu on 17/10/19.
//  Copyright © 2019 Spandana Batchu. All rights reserved.
//

import Foundation

// Purchase a list of items and return the final result of ALL purchases.

struct Store {
    static func purchaseItem(itemName: String) -> Bool {
        //Do some purchasing here
        return true
    }
}

struct PurchaseManager {

    var items = ["Apples", "Oranges", "Melons", "Bananas"]

    func purchaseAllItems1() -> Bool {
        var saveResultsForPurchase: [Bool] = []
        saveResultsForPurchase.append(contentsOf: [true])
        for item in items {
            let result = Store.purchaseItem(itemName: item)
            saveResultsForPurchase.append(result)
        }
        return saveResultsForPurchase.allSatisfy { $0 }
    }

    func purchaseAllItems2() -> Bool {
        return items.map{Store.purchaseItem(itemName: $0)}.reduce(true) { $0 && $1 }
    }

}
