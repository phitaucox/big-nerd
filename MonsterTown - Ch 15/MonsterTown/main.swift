//
//  main.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

var myTown = Town()
myTown.changePopulation(500)

let fredTheZombie = Zombie()
fredTheZombie.changeName("Fred the Zombie", walksWithLimp: false)
fredTheZombie.town = myTown
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printTownDescription()




