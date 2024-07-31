//: [Previous](@previous)

import Foundation

typealias Characteristic = Double
typealias History = (characteristics: [Characteristic], result: Double)
typealias Metric = (distance: Double, result: Double)

let history = [
    "A": (characteristics: [5.0, 1.0, 0.0], result: 300.0),
    "B": (characteristics: [3.0, 1.0, 1.0], result: 225.0),
    "C": (characteristics: [1.0, 1.0, 0.0], result: 75.0),
    "D": (characteristics: [4.0, 0.0, 1.0], result: 200.0),
    "E": (characteristics: [4.0, 0.0, 0.0], result: 150.0),
    "F": (characteristics: [2.0, 0.0, 0.0], result: 50.0)
]

print(history.regression(forCharacteristics: [4.0, 1.0, 0.0], knn: 4))

extension [String: History] {
    func regression(forCharacteristics: [Characteristic], knn: Int? = nil) -> Double {
        reduce(into: [String: Metric]()) { partialResult, elem in
            partialResult[elem.key] = (distance(from: forCharacteristics, to: elem.key), elem.value.1)
        }
        .average(for: knn ?? Int(Double(count).squareRoot()))
    }

    private func distance(from: [Characteristic], to: String) -> Double {
        let toCharacteristcs = self[to]!.0
        var squareSum = 0.0
        for i in 0..<from.count {
            squareSum += pow(from[i] - toCharacteristcs[i], 2)
        }
        return squareSum.squareRoot()
    }
}

extension [String: Metric] {
    func average(for knn: Int) -> Double {
        let sum = sorted { $0.value.distance < $1.value.distance }
            .prefix(knn)
            .reduce(0) { $0 + $1.value.result }
        return sum / Double(knn)
    }
}

//: [Next](@next)
