//
//  PokemonImage.swift
//  Pokedex
//
//  Created by MacBook on 13.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonImage: View {

    let imageURL: URL

    var body: some View {
        WebImage(url: imageURL)
            .resizable()
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .aspectRatio(1, contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
    }
}
