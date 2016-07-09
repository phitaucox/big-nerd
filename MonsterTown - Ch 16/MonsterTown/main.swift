//
//  main.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

var myTown = Town()
let ts = myTown.townSize
print(ts)
myTown.changePopulation(1000000)
print("Size: \(myTown.townSize); Population: \(myTown.population)")

let fredTheZombie = Zombie()
fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()
print("Victim pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}



