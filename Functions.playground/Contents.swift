//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, playgroud.")
}

printGreeting()

func printPersonalGreetingWithName(name: String) {
    print("Hello \(name), you're awesome!")
}

printPersonalGreetingWithName("Cox")

func divisionDescriptionForNumerator(num: Double, andDenominator den: Double, withPunctuation punctuation: String = ".") -> Double {
    print("\(num) divided by \(den) equals \(num / den)\(punctuation)")
    return num / den
}

let answer = divisionDescriptionForNumerator(4, andDenominator: 2)
print(answer)

func printPersonalGreetingsWithNames(names: String...) {
    for name in names {
        print("Hey \(name), welcome to the playground homie!")
    }
}

printPersonalGreetingsWithNames("James", "Miguel")

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {      // the name param is a tuple of type (String, String?, String)
    guard let middleName = name.middle else {
        print("You ain't got no middle name fool!")
        return
    }
    print("Hey \(middleName)!")
}

greetByMiddleName(("Ralph", "Waldo", "Emerson"))
greetByMiddleName(("Ralph", nil, "Emerson"))

