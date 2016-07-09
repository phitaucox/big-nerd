//
//  Town.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

struct Town {
    var population = 5422
    var numberOfStoplights = 4
    
    func printTownDescription() {
        print("This town has a population of \(population) with \(numberOfStoplights) stoplights.")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}