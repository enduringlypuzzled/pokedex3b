//
//  PokeCollectionViewCell.swift
//  Pokedex3B
//
//  Created by Steve Mecking on 2016-11-10.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit

class PokeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    
    required init?(coder aDecoder:NSCoder){
        super.init(coder:aDecoder)
        
        layer.cornerRadius = 5.0
        
    }
    
    var pokemon:Pokemon!
    
    func configureCell(_ pokemon:Pokemon){
        
        self.pokemon = pokemon
        myLabel.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
    
}
