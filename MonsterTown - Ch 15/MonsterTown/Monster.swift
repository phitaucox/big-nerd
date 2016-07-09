//
//  Monster.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is straight up wrecking a town!")
        } else {
            print("\(name) is bored cuz they don't have a town to wreck :(")
        }
    }
}
