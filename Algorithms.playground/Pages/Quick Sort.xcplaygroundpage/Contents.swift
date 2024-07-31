//: [Previous](@previous)

import Foundation

extension Array where Element: Comparable {
    func quickSorted() -> [Element] {
        guard count > 1 else { return self }
        let pivot = self[0]
        let lowers = self[1..<count].filter { $0 <= pivot }
        let highers = self[1..<count].filter { $0 > pivot }
        return lowers.quickSorted() + [pivot] + highers.quickSorted()
    }
}

print([7,5,2,4,9,3,1].quickSorted())
print([1].quickSorted())
print(["f", "c", "a", "b"].quickSorted())
print([Int]().quickSorted())

//: [Next](@next)
