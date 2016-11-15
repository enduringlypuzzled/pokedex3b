//
//  ViewController.swift
//  TestCollection
//
//  Created by Steve Mecking on 2016-11-09.
//  Copyright © 2016 Steve Mecking. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let reuseIdentifier = "cell"
    @IBOutlet weak var collection:UICollectionView!
    @IBOutlet weak var mButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var musicPlayer: AVAudioPlayer!
    var filteredPokemon = [Pokemon]()
    var pokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collection.datasource = self
        //collection.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        parsePokemonCSV()
        initAudio()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    //Function for audio
    func initAudio(){
        let path = Bundle.main.path(forResource: "supermario", ofType: "mp3")!
        
        do{
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string:path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
            
        } catch let err as NSError{
            print(err.debugDescription)
        }
        
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
            let poke: Pokemon!
            
            if inSearchMode {
                
                poke = filteredPokemon[indexPath.row]
                cell.configureCell(poke)
                
            }else {
                poke = pokemon[indexPath.row]
                cell.configureCell(poke)
                
            }
            
            return cell
        } else {
            return UICollectionViewCell()
        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            
            return filteredPokemon.count
            
        }
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
    
    @IBAction func musicBtnPressed(_ sender: AnyObject) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            mButton.alpha = 0.2
        }
        else {
            musicPlayer.play()
            mButton.alpha = 1.0
            
            
        }
        
    }
    
    //Search Bar ------------------------------------------------------------------------------------
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
            
            //get rid of keyboard
            view.endEditing(true)
            
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            //filter
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            collection.reloadData()
            
        }
    }
    
}

