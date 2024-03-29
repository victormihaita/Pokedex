//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by MacBook on 13.10.2021.
//

import SwiftUI

struct PokemonDetailView: View {

    let pokemon: Pokemon

    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                VStack(spacing: 8) {
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)

                    Text(pokemon.type.capitalized)
                        .italic()
                        .foregroundColor(pokemon.typeColor)
                }

                PokemonImage(imageURL: URL(string: pokemon.imageURL)!)
                    .frame(maxWidth: proxy.size.width)
                    .padding(.bottom, -100)
                    .zIndex(1)

                ZStack(alignment: .bottom) {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.75)
                        .foregroundColor(pokemon.typeColor)

                    VStack {
                        Text(pokemon.description.replacingOccurrences(of: "\n", with: ""))
                            .foregroundColor(.white)
                            .padding()
                            .frame( maxWidth: 700, alignment: .center)

                        StatsGroup(pokemon: pokemon)
                    }
                }
            }
            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
        }
    }
}
