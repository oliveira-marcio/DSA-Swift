//: [Previous](@previous)

import Foundation

extension Array where Element: Comparable {
    private var smallestIndex: Int {
        var smallestIndex = 0
        var smallest = self[0]
        for index in 1..<count {
            guard self[index] < smallest else { continue }
            smallest = self[index]
            smallestIndex = index
        }
        return smallestIndex
    }

    func selectionSorted() -> [Element] {
        var list = self
        return (0..<list.count).reduce([]) { partialList, _ in
            let smallestIndex = list.smallestIndex
            return partialList + [list.remove(at: smallestIndex)]
        }
    }
}

print([7,5,2,4,9,3,1].selectionSorted())

//: [Next](@next)
