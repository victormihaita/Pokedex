//
//  PokemonModel.swift
//  Pokedex
//
//  Created by MacBook on 13.10.2021.
//

import Foundation
import SwiftUI

struct Pokemon: Identifiable, Decodable {
    let pokeID = UUID()

    let id: Int
    var name: String
    let type: String
    let imageURL: String
    let description: String

    let attack: Int
    let defense: Int
    let height: Int
    let weight: Int

    var isFavorite = false
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case imageURL = "imageUrl"
        case description
        case attack
        case defense
        case height
        case weight
    }

    var typeColor: Color {
        switch type {
        case "fire":
            return Color(.systemRed)
        case "poison":
            return Color(.systemGreen)
        case "water":
            return Color(.systemTeal)
        case "electric":
            return Color(.systemYellow)
        case "psychic":
            return Color(.systemPurple)
        case "normal":
            return Color(.systemOrange)
        case "ground":
            return Color(.systemBrown)
        case "flying":
            return Color(.systemBlue)
        case "fairy":
            return Color(.systemPink)
        default:
            return Color(.systemIndigo)
        }
    }
}

