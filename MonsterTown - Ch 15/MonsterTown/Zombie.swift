//
//  Zombie.swift
//  MonsterTown
//
//  Created by Cox, Christian on 5/8/16.
//  Copyright © 2016 Cox, Christian. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp = true
    
    // final keyword means subclasses of Zombie cannot override terrorizeTown()
    final override func terrorizeTown() {
        town?.changePopulation(-10)
        super.terrorizeTown()
    }
    
    func changeName(name: String, walksWithLimp: Bool) {
        self.name = name
        self.walksWithLimp = walksWithLimp
    }
}
