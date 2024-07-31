//: [Previous](@previous)

import Foundation

// 1) Sum the numbers in a list
// 2) Count the number of itens in a list
// 3) Find the highest number in a list

extension [Int] {
    func sum() -> Int {
        if isEmpty { return 0 }
        var list = self
        return list.removeFirst() + list.sum()
    }

    func count() -> Int {
        if isEmpty { return 0 }
        var list = self
        list.removeFirst()
        return 1 + list.count()
    }

    func highest() -> Int? {
        if isEmpty { return nil }
        var list = self
        let current = list.removeFirst()
        let next = list.highest() ?? 0
        return current > next ? current : next
    }
}

print("sum: \([1,2,3,4].sum())")
print("sum: \([1].sum())")
print("sum: \([Int]().sum())")

print("count: \([1,2,3,4].count())")
print("count: \([1].count())")
print("count: \([Int]().count())")

print("highest: \([5,2,5,4].highest())")
print("highest: \([1].highest())")
print("highest: \([Int]().highest())")

//var x = [5,2,5,4]
//let y = x.suffix(3)[1...2]
//print(y)
//: [Next](@next)
