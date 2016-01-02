//
//  Character.swift
//  Multiplayer-game-oop
//
//  Created by Jonatan Knudsen on 02/01/2016.
//  Copyright © 2016 Jonatan Knudsen. All rights reserved.
//

import Foundation

class Charactor {
    private var _hp = 100
    private var _attackPwr = 6
    private var _name = "Player"
    private var _coolDown = false
    var isAlive = true
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPwr: Int {
        return _attackPwr
    }
    
    var name: String {
        return _name
    }
    
    init(attackPwr: Int, name: String) {
        self._hp = hp
        self._attackPwr = attackPwr
        self._name = name
        print("\(self._name) was created")
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        _hp -= attackPwr
        return true
    }
}