//: [Previous](@previous)

import Foundation

var voters = Set<String>()

func checkVoter(_ name: String) {
    if voters.contains(name) {
        print("Go away!")
    } else {
        voters.insert(name)
        print("Let it vote!")
    }
}

var votersMap = [String : Bool]()

func checkVoter2(_ name: String) {
    if votersMap[name] == nil {
        votersMap[name] = true
        print("Let it vote!")
    } else {
        print("Go away!")
    }
}

checkVoter("tom")
checkVoter("mike")
checkVoter("mike")

checkVoter2("tom")
checkVoter2("mike")
checkVoter2("mike")

//: [Next](@next)
