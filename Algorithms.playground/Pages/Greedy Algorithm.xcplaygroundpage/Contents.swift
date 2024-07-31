//: [Previous](@previous)

import Foundation

extension [String] {
    func best(in stationsCoverage: [String: Set<String>]) -> Set<String> {
        var statesToCover = Set(self)
        var finalStations = Set<String>()
        print("States to cover: \(statesToCover)")
        print("++++++++++++++++++++++++++++++")
        while !statesToCover.isEmpty {
            var bestStation: String?
            var coveredStates = Set<String>()
            for (station, states) in stationsCoverage {
                let coveredByStation = statesToCover.intersection(states)
                print("Covered by \(station): \(coveredByStation)")
                print("Covered states: \(coveredStates)")
                if coveredByStation.count > coveredStates.count {
                    bestStation = station
                    coveredStates = coveredByStation
                    print("Best station: \(bestStation)")
                    print("Updated covered states: \(coveredStates)")
                }
                print("-----------------")
            }
            finalStations.insert(bestStation!)
            statesToCover.subtract(coveredStates)
            print("Final stations: \(finalStations)")
            print("States to cover: \(statesToCover)")
            print("++++++++++++++++++++++++++++++")
        }
        return finalStations
    }
}

let stationsCoverage = [
    "kone": Set(["id", "nv", "ut"]),
    "ktwo": Set(["wa", "id", "mt"]),
    "kthree": Set(["or", "nv", "ca"]),
    "kfour": Set(["nv", "ut"]),
    "kfive": Set(["ca", "az"])
]
print(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"].best(in: stationsCoverage))

//: [Next](@next)
