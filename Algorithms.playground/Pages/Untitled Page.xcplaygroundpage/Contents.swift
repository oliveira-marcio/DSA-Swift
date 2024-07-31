//: [Previous](@previous)

import Foundation

func countPosSumNeg(_ arr: [Int]?) -> [Int] {
    guard let arr, !arr.isEmpty else { return [] }
    return arr.reduce([0, 0]) { acc, elem in
        [
            elem > 0 ? acc[0] + 1 : acc[0],
            elem < 0 ? acc[1] + elem : acc[1]
        ]
    }
}

func countPosSumNeg2(_ arr: [Int]?) -> [Int] {
    guard let arr, !arr.isEmpty else { return [] }
    return arr.reduce(into: [0, 0]) { partialResult, elem in
        if elem > 0 { partialResult[0] += 1 } else
        if elem < 0 { partialResult[1] += elem }
    }
}
countPosSumNeg([1,2,3,4,5,6,7,8,9,10,-11,-12,-13,-14,-15])
countPosSumNeg([91,-4,80,-73,-28])
countPosSumNeg([])
countPosSumNeg2([1,2,3,4,5,6,7,8,9,10,-11,-12,-13,-14,-15])
countPosSumNeg2([91,-4,80,-73,-28])
countPosSumNeg2([])
//: [Next](@next)
