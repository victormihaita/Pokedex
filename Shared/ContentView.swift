//
//  ContentView.swift
//  Shared
//
//  Created by MacBook on 13.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    var viewModel = PokemonViewModel()
    @State var pokemon: [Pokemon] = []

    let columns = [
        GridItem(.adaptive(minimum: 350, maximum: 500))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(pokemon, id: \.id) { poke in
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(poke.name.capitalized)
                                    .font(.title)
                                HStack {
                                    Text(poke.type.capitalized)
                                        .italic()
                                }
                                Text(poke.description)
                                    .font(.caption)
                                    .lineLimit(2)
                            }

                            Spacer()

                            WebImage(url: URL(string: poke.imageURL))
                                .resizable()
                                .interpolation(.medium)
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
            .onAppear(perform: {
                async {
                    pokemon = try! await viewModel.fetchPokemon()
                }
            })
            .navigationTitle("Pokedex")
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


