//
//  main.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

var myTown = Town(population: 10000, stoplights: 6)
myTown.printTownDescription()
let ts = myTown.townSize
print(ts)
myTown.changePopulation(1000000)
print("Size: \(myTown.townSize); Population: \(myTown.population)")

var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.changeName("Fred the Zombie", walksWithLimp: false)
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printTownDescription()
print("Victim pool: \(fredTheZombie?.victimPool)")
fredTheZombie?.victimPool = 500
print("Victim pool: \(fredTheZombie?.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
fredTheZombie = nil

var convenientZombie = Zombie(limp: true, fallingApart: false)



