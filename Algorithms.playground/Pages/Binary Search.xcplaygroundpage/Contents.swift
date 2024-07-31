//: [Previous](@previous)

import Foundation

extension Array where Element: Comparable {
    func bSearch(_ element: Element) -> (Int?, Int) {
        var lowerIndex = 0
        var higherIndex = count - 1
        var attempt = 0
        while lowerIndex <= higherIndex {
            attempt += 1
            var midIndex = (lowerIndex + higherIndex) / 2
            let guess = self[midIndex]
            if guess == element {
                return (midIndex, attempt)
            } else if guess < element {
                lowerIndex = midIndex + 1
            } else {
                higherIndex = midIndex - 1
            }
        }
        return (nil, attempt)
    }
}

//let (index, attempt) = [1,3,4,7,9,10,13,20,21,23,24,26,34,35,38,40].bSearch(7)
//print("Found element at \(index ?? -1) in \(attempt) attempts")

let clock = ContinuousClock()
let result = clock.measure {
    _ = Array(1...10_000_000).bSearch(1)
//    _ = Array(1...10_000_000)[1..<10_000_000].bSearch(1)
}
print(result)

//: [Next](@next)
