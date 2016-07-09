//: Playground - noun: a place where people can play

import Cocoa

var bucketList: [String] = ["Everest"]
var newItems = ["Rainier", "Kilimanjaro", "Hood"]
bucketList += newItems
bucketList.insert("Batchelor", atIndex: 1)

// Silver
print(bucketList)
let reversedArray = bucketList.reverse()
for item in bucketList {
    
}
print(reversedArray)


// Bronze
print(bucketList.isEmpty)
bucketList.removeAll()
print(bucketList.isEmpty)
