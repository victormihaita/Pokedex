//
//  ContentView.swift
//  Shared
//
//  Created by MacBook on 13.10.2021.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PokemonViewModel()

    let columns = [
        GridItem(.adaptive(minimum: 300, maximum: 400))
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 24) {
                    ForEach(viewModel.pokemon, id: \.id) { poke in
                        NavigationLink(destination: PokemonDetailView(pokemon: poke)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(poke.name.capitalized)
                                        .font(.title)
                                    HStack {
                                        Text(poke.type.capitalized)
                                            .italic()
                                        Circle()
                                            .foregroundColor(poke.typeColor)
                                            .frame(width: 10, height: 10)
                                    }
                                    Text(poke.description)
                                        .font(.caption)
                                        .lineLimit(2)
                                }

                                Spacer()

                                WebImage(url: URL(string: poke.imageURL))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .frame(width: 100, height: 100)
                            }
                            .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(poke.typeColor, lineWidth: 1)
                                )
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Pokedex")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


