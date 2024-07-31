//: [Previous](@previous)

import Foundation

extension Int {
    func factorial() -> Int {
        self == 1 ? 1 : self * (self - 1).factorial()
    }
}

print(6.factorial())

//: [Next](@next)
