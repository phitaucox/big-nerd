//
//  Monster.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise : String {
        return "Grrr"
    }
    var town: Town?
    var name: String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    required init(town: Town?, monsterName: String) {
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is straight up wrecking a town!")
        } else {
            print("\(name) is bored cuz they don't have a town to wreck :(")
        }
    }
}
