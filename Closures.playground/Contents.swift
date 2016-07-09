//: Playground - noun: a place where people can play

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

//func sortAscending(i: Int, j: Int) -> Bool {
//    return i < j
//}
//
//let volunteersSorted = volunteerCounts.sort(sortAscending)

//let volunteersSorted = volunteerCounts.sort({
//    (i: Int, j: Int) -> Bool in
//    return i < j
//    })

//let volunteersSorted = volunteerCounts.sort({ i, j in i < j })

let volunteersSorted = volunteerCounts.sort { $0 < $1 }


////////////////////////////////////////////////////////////////////////


func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

var stoplights = 4
let townPlan = makeTownGrand()
stoplights = townPlan(4, stoplights)
print("Knowhere has \(stoplights) stoplights.")
