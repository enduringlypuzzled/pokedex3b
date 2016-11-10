//
//  Pokemon.swift
//  Pokedex3B
//
//  Created by Steve Mecking on 2016-11-10.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name:String!
    private var _pokedexId: Int!
    
    
    var name:String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name:String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
    }
    
}
