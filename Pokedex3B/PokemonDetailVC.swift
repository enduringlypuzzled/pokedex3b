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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var defenceLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    
    @IBOutlet weak var currentevoImage: UIImageView!
    @IBOutlet weak var nextevoImage: UIImageView!
    @IBOutlet weak var evoLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name
        
        
    }

      

    
}
