//
//  ListExample.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 01/05/26.
//

import SwiftUI

private var pokemons: [Pokemon]{
    var pokemons: [Pokemon] = []
    pokemons.append(Pokemon(name: "Pikachu"))
    pokemons.append(Pokemon(name: "Charizard"))
    pokemons.append(Pokemon(name: "Squirtle"))
    pokemons.append(Pokemon(name: "Bulbasaur"))
    return pokemons
}

private var players: [Jugadores]{
    var players: [Jugadores] = []
    players.append(Jugadores(name: "CR7"))
    players.append(Jugadores(name: "Vini JR"))
    players.append(Jugadores(name: "Kroos"))
    players.append(Jugadores(name: "Modric"))
    return players
}

struct ListExample: View {
    var body: some View {
//        List{
//            ForEach(pokemons, id: \.name) { pokemon in
//                Text(pokemon.name)
//            }
//        }
//        List(players){ player in
//            Text(player.name)
//        }
        List{
            Section {
                ForEach(pokemons, id: \.name) { pokemon in
                    Text(pokemon.name)
                }
            } header: {
                Text("Pokemons")
            }
            
            Section {
                ForEach(players){ player in
                    Text(player.name)
                }
            } header: {
                Text("Players").background(.red)
            }

        }.listStyle(.automatic)
    }
}

struct Pokemon{
    let name: String
}

struct Jugadores: Identifiable{
    let id = UUID()
    let name: String
}

#Preview {
    ListExample()
}
