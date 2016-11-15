//
//  PokemonDetailVC.swift
//  Pokedex3B
//
//  Created by Steve Mecking on 2016-11-15.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon:Pokemon!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
        
        
    }

      

    
}
