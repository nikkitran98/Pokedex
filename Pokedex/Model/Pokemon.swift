//
//  Pokemon.swift
//  Pokedex
//
//  Created by Nikki Tran on 5/24/23.
//

import Foundation
import UIKit

struct EvolutionChain {
    var evolutionArray: [[String: AnyObject]]?
    var evolutionIds = [Int]()
    
    init(evolutionArray: [[String: AnyObject]]) {
        self.evolutionArray = evolutionArray
        self.evolutionIds = setEvolutionIds()
    }
    
    func setEvolutionIds() -> [Int] {
        var results = [Int]()
        
        evolutionArray?.forEach({ (dictionary) in
            if let idString = dictionary["id"] as? String {
                guard let id = Int(idString) else { return }
                
                if id <= 151 {
                    results.append(id)
                }
            }
        })
        return results
    }
}

class Pokemon {
    var name: String?
    var imageUrl: String?
    var image: UIImage?
    var id: Int?
    var weight: Int?
    var height: Int?
    var defense: Int?
    var attack: Int?
    var description: String?
    var type: String?
    var baseExperience: Int?
    var evolutionChain: [[String: AnyObject]]? // array of dictionaries
    var evoArray: [Pokemon]?
    
    init(id: Int, dictionary: [String: AnyObject]) {
        
        self.id = id
        self.name = dictionary["name"] as? String
        self.imageUrl = dictionary["imageUrl"] as? String
        self.image = dictionary["image"] as? UIImage
        self.weight = dictionary["weight"] as? Int
        self.height = dictionary["height"] as? Int
        self.defense = dictionary["defense"] as? Int
        self.attack = dictionary["attack"] as? Int
        self.description = dictionary["description"] as? String
        self.type = dictionary["type"] as? String
        self.evolutionChain = dictionary["evolutionChain"] as? [[String: AnyObject]]
    }
    
}


