//: Playground - noun: a place where people can play

import Cocoa

var myGroceryBag = Set<String>()
myGroceryBag.insert("Apples")
myGroceryBag.insert("Trail Mix")
myGroceryBag.insert("TP")
print(myGroceryBag)

var gfGroceryBag: Set = ["Deodorant", "TP", "Q-Tips"]
print(gfGroceryBag)
print(gfGroceryBag.contains("TP"))
print(gfGroceryBag.contains("Tape"))

let everythingWeHave = myGroceryBag.union(gfGroceryBag)
print(everythingWeHave)

let dupes = myGroceryBag.intersect(gfGroceryBag)
print(dupes)

print(myGroceryBag.isDisjointWith(gfGroceryBag))
myGroceryBag.remove("TP")
print(myGroceryBag.isDisjointWith(gfGroceryBag))
