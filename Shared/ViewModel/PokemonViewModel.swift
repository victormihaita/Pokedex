//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by MacBook on 13.10.2021.
//

import Foundation
import Combine
import SwiftUI

enum FetchError: Error {
    case badURL
    case badRequest
    case badData

}

class PokemonViewModel: ObservableObject {

    @Published var pokemon: [Pokemon] = []

    init() {
        Task {  
            pokemon = try await fetchPokemon()
        }
    }

    func fetchPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else { throw FetchError.badURL }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badRequest }
        guard let data = data.removeNullsFrom(string: "null,") else { throw FetchError.badData }
        return try JSONDecoder().decode([Pokemon].self, from: data)
    }

    let MOCK_POKEMON = Pokemon(id: 0, name: "Bulbasaur", type: "poison", imageURL: "https://firebasestorage.googleapis.co...", description: "This is a test example of what the text in the description would look like for the given pokemon. This is a test example of what the text in the description would look like for the given pokemon.", attack: 49, defense: 52, height: 10, weight: 98)
}

extension Data {
    func removeNullsFrom(string: String) -> Data? {
        let stringData = String(data: self, encoding: .utf8)
        let parsedDataString = stringData?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
