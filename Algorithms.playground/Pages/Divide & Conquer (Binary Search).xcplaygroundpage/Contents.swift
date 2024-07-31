//: [Previous](@previous)

import Foundation

extension Array where Element: Comparable {
    func bSearch(_ element: Element) -> Int? {
//        print(self)
        if isEmpty { return nil}
        let midIndex = (count - 1) / 2
        var list = self
        let guess = list[midIndex]
        if guess == element {
            return midIndex
        } else if guess < element {
            list.removeSubrange(0...midIndex)
            guard let partialIndex = list.bSearch(element) else { return nil }
            return midIndex + partialIndex + 1
        } else {
            list.removeSubrange(midIndex..<count)
            return list.bSearch(element)
        }
    }
}

extension ArraySlice where Element: Comparable {
    func bSearch(_ element: Element) -> Int? {
//        print(self)
        if isEmpty { return nil}
        let midIndex = (count - 1) / 2
        let guess = self[startIndex + midIndex]
        if guess == element {
            return startIndex + midIndex
        } 
        return (guess < element ? suffix(count / 2) : prefix(midIndex)).bSearch(element)
    }
}

//print([1,3,4,7,9,10,13,20,21,23,24,26,34,35,38,40].bSearch(1))
//print([1,3,4,7,9,10,13,20,21,23,24,26,34,35,38,40][0...15].bSearch(1))


//(1...40).forEach {
//    if let index = [1,3,4,7,9,10,13,20,21,23,24,26,34,35,38,40].bSearch($0) {
//        print("Found element \($0) at \(index)")
//    }
//}

//print("----------------------------------------")
//(1...40).forEach {
//    if let index = [1,3,4,7,9,10,13,20,21,23,24,26,34,35,38,40][0...15].bSearch($0) {
//        print("Found element \($0) at \(index)")
//    }
//}

let clock = ContinuousClock()
let result = clock.measure {
//    _ = Array(1...10_000_000).bSearch(1)
    _ = Array(1...10_000_000)[1..<10_000_000].bSearch(1)
}
print(result)
//: [Next](@next)
