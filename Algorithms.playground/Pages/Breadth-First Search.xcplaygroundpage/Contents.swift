//: [Previous](@previous)

import Foundation

// https://github.com/raywenderlich/swift-algorithm-club/tree/master/Deque
struct Deque<T>: CustomStringConvertible {
    private var array = [T]()
    var isEmpty: Bool { array.isEmpty }
    var count: Int { array.count }
    var front: T? { array.first }
    var back: T? { array.last }
    var description: String { "\(array)" }

    mutating func enqueue(_ element: T) { array.append(element) }
    mutating func enqueueFront(_ element: T) { array.insert(element, at: 0) }
    mutating func dequeue() -> T? { isEmpty ? nil : array.removeFirst() }
    mutating func dequeueBack() -> T? { isEmpty ? nil : array.removeLast() }
}

typealias Relationships = [String : String] // [Child : Parent]

extension [String : [String]] {
    func route(_ target: String, from name: String) {
        var searchQueue = Deque<String>()
        var parents = Relationships()
        self[name]?.forEach {
            parents[$0] = parents[$0] ?? name
            searchQueue.enqueue($0)
        }
        var processed = [String]()
        var targetFound: String?
        while !searchQueue.isEmpty {
//            print("Queue: \(searchQueue) / Searched: \(processed)")
            let person = searchQueue.dequeue()!
            guard !processed.contains(person) else { continue }
            if person == target {
                targetFound = person
                break
            }
            self[person]?.forEach {
                parents[$0] = parents[$0] ?? person
//                print(parents)
                searchQueue.enqueue($0)
            }
            processed.append(person)
        }
        displayRoute(target: targetFound, parents: parents)
    }

    private func displayRoute(target: String?,
                              parents: Relationships) {
        guard let target else {
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
    }
}

let graph1 = [
    "you": ["alice", "bob", "claire"],
    "alice": ["peggy"],
    "bob": ["anuj", "peggy"],
    "claire": ["thom", "jonny"],
    "peggy": ["jonny"],
    "anuj": [],
    "thom": [],
    "jonny": []
]

let graph2 = [
    "start": ["a", "b"],
    "a": ["end"],
    "b": ["a", "end"],
    "end": []
]

graph1.route("jonny", from: "you")
graph2.route("end", from: "start")

let graph3 = [
    "book": ["poster", "lp"],
    "poster": ["bass", "drums"],
    "lp": ["bass", "drums", "piano"],
    "bass": ["piano"],
    "drums": ["piano"],
    "piano": []
]

graph3.route("piano", from: "book")


//: [Next](@next)
