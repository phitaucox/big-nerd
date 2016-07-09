//
//  Town.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

struct Town {
    let region: String
    var population: Int {
        didSet(oldPopulation) {
            print("The population has changed to \(population) from \(oldPopulation).")
        }
    }
    var numberOfStoplights: Int
    
    init(region: String, population: Int, stoplights: Int) {
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    
    init(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    enum Size {
        case Small
        case Medium
        case Large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.Small
                
            case 10001...100000:
                return Size.Medium
                
            default:
                return Size.Large
            }
        }
    }
    
    func printTownDescription() {
        print("This town in the \(region) region has a population of \(population) with \(numberOfStoplights) stoplights.")
    }
    
    mutating func changePopulation(amount: Int) {
        population += amount
    }
}