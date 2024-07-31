//: [Previous](@previous)

import Foundation

typealias Characteristic = (weight: Int, price: Int)
typealias Arrangement = (totalPrice: Int, items: [String])

extension [String : Characteristic] {
    func best(forWeight weight: Int) -> Arrangement {
        let emptyArrangement = Arrangement(0, [])
        var table = Array(repeating: Array(repeating: emptyArrangement,
                                           count: weight),
                          count: count)
        let items = Array(keys)
        for row in 0..<count {
            let item = items[row]
            let (itemWeight, itemPrice) = self[item]!
            for col in 0..<weight {
                let lastArrangementForWeight = row > 0 ? table[row-1][col] : emptyArrangement
                let remainingWeightWithItem = col - itemWeight
                let lastArrangementForRemainingWeight = row > 0 && remainingWeightWithItem >= 0 ? table[row-1][remainingWeightWithItem] : emptyArrangement
                let itemPriceForWeight = itemWeight - 1 <= col ? itemPrice : 0
                let accumulatedTotalPrice = itemPriceForWeight + lastArrangementForRemainingWeight.totalPrice
                table[row][col] = accumulatedTotalPrice > lastArrangementForWeight.totalPrice ? Arrangement(accumulatedTotalPrice, lastArrangementForRemainingWeight.items + [item]) : lastArrangementForWeight
            }
        }
        return table[count - 1][weight - 1]
    }
}

let items = [
    "radio": (weight: 4, price: 3000),
    "notebook": (weight: 3, price: 2000),
    "guitar": (weight: 1, price: 1500),
//    "iPhone": (weight: 1, price: 2000),
]

print(items.best(forWeight: 4))

//: [Next](@next)
