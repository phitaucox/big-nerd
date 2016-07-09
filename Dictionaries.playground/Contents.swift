//: Playground - noun: a place where people can play

import Cocoa

var foreverYoung = ["Matt": 32, "John": 33]
foreverYoung.updateValue(40, forKey: "John")
foreverYoung["Rod"] = 40
print(foreverYoung["Matt"])

var movies: [String:Int] = [:]
var videoGames = [String:String]()
videoGames["Dark Souls III"] = "amazing"
videoGames.updateValue("meh", forKey: "Banjo-Kazooie")
print(videoGames)
videoGames.removeValueForKey("Dark Souls III")
print(videoGames)
for (key, value) in videoGames {
    print(key + " - " + value)
}
print(Array(videoGames))