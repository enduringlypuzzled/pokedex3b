//
//  ViewController.swift
//  TestCollection
//
//  Created by Steve Mecking on 2016-11-09.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "cell"
    @IBOutlet weak var collection:UICollectionView!
    
    var pokemon = [Pokemon]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collection.datasource = self
        //collection.delegate = self
        
        parsePokemonCSV()
    }
    
    
    // Function to get information from pokemon.csv file
    func parsePokemonCSV(){
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            
            //new stuff
            for row in rows {
                let pokeId = Int(row["id"]!)!
                let name = String(row["identifier"]!)!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            } // end for
    
        } catch let err as NSError {
            print(err.debugDescription)
        }
    
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PokeCollectionViewCell {
            //let pokemon = Pokemon(name: "Pokemon", pokedexId:indexPath.row)
            let poke = pokemon[indexPath.row]
            
            cell.configureCell(poke)
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
}

