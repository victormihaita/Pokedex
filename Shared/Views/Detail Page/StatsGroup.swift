//
//  StatsGroup.swift
//  Pokedex
//
//  Created by MacBook on 13.10.2021.
//

import SwiftUI

struct StatsGroup: View {

    let pokemon: Pokemon

    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 300, height: 250)
                .foregroundColor(.white)
                .opacity(0.6)
                .cornerRadius(20)

            VStack(alignment: .leading, spacing: 30) {
                StatView(pokemon: pokemon, statName: "Atk", statColor: .red, statValue: pokemon.attack)
                StatView(pokemon: pokemon, statName: "Def", statColor: .green, statValue: pokemon.defense)
                StatView(pokemon: pokemon, statName: "Hgt", statColor: .blue, statValue: pokemon.height)
                StatView(pokemon: pokemon, statName: "Wgh", statColor: .cyan, statValue: pokemon.weight)
            }
        }
    }
}

struct StatsGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsGroup(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
