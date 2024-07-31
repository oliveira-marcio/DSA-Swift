//: [Previous](@previous)

import Foundation

typealias Costs = [String : Int]
typealias Relationships = [String : String] // [Child : Parent]

extension [String : Costs] {
    func route(_ target: String, from start: String) {
        var processed = [String]()
        var (costs, parents) = compute(from: start)
        while true {
            let unprocessedCosts = processed.isEmpty ? costs : costs.filter { !processed.contains($0.key) }
            guard let lowestCost = findLowestCost(in: unprocessedCosts) else { break }
            processed.append(lowestCost.key)
            update(lowestCost: lowestCost, costs: &costs, parents: &parents)
        }
        displayRoute(target: target, costs: costs, parents: parents)
    }

    private func findLowestCost(in costs: Costs?) -> Costs.Element? {
        let lowest = costs?.reduce(nil) { lowest, element in
            element.value < (lowest?.value ?? Int.max) ? element : lowest
        }
        return lowest
    }

    private func compute(from node: String) -> (Costs, Relationships) {
        var costs = Costs()
        var relationship = Relationships()
        keys.forEach { key in
            guard key != node else { return }
            if let neighborCost = self[node]?[key] {
                costs[key] = neighborCost
                relationship[key] = node
            } else {
                costs[key] = Int.max
            }
        }
        return (costs, relationship)
    }

    private func update(lowestCost: Costs.Element,
                        costs: inout Costs,
                        parents: inout Relationships) {
        let neighbors = self[lowestCost.key]
        neighbors?.forEach { neighbor in
            let newCost = lowestCost.value + neighbor.value
            guard let neighborCost = costs[neighbor.key],
                  neighborCost > newCost else { return }
            costs[neighbor.key] = newCost
            parents[neighbor.key] = lowestCost.key
        }
    }

    private func displayRoute(target: String,
                              costs: Costs,
                              parents: Relationships) {
        guard let lowestCost = costs[target] else {
            print("Invalid route!")
            return
        }
        var parent = parents[target]
        var route = [target]
        while(parent != nil) {
            route.append(parent!)
            parent = parents[parent!]
        }
        print(route.reversed().joined(separator: " => "))
        print("Cost: \(lowestCost)")
    }
}

let graph1 = [
    "start": ["a": 6, "b": 2],
    "a": ["end": 1],
    "b": ["a": 3, "end": 5],
    "end": [:]
]

let graph2 = [
    "book": ["poster": 0, "lp": 5],
    "poster": ["bass": 30, "drums": 35],
    "lp": ["bass": 15, "drums": 20],
    "bass": ["piano": 20],
    "drums": ["piano": 10],
    "piano": [:]
]

graph1.route("end", from: "start")
graph2.route("piano", from: "book")
////: [Next](@next)
