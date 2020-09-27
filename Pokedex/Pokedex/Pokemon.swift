//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alan Soares on 25/09/20.
//  Copyright © 2020 Alan Soares. All rights reserved.
//

import Foundation

struct PokemonList: Codable {
    let results: [Pokemon]
}
			
struct Pokemon: Codable {
    let name: String
    let url: String
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}

struct PokemonType: Codable  {
    let name: String
    let url: String
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type: PokemonType
}





