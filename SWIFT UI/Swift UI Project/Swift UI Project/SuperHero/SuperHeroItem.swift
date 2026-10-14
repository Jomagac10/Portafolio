//
//  SuperHeroItem.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct SuperHeroItem: View {
    let superHero: HeroItem

    private var imageURL: URL? {
        guard var raw = superHero.image?.url, !raw.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return nil }
        // Trim whitespace/newlines
        raw = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        // Force https
        if raw.hasPrefix("http://") {
            raw = "https://" + raw.dropFirst("http://".count)
        }
        return URL(string: raw)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Color.gray.opacity(0.2)
                        ProgressView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity.animation(.easeInOut(duration: 0.2)))
                case .failure( _):
                    ZStack {
                        Color.gray.opacity(0.2)
                        Image(systemName: "photo")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                    }
                @unknown default:
                    Color.gray.opacity(0.2)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            

            // Title overlay
            Text(superHero.name ?? "")
                .font(.title3)
                .bold()
                .foregroundStyle(.white)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(.black.opacity(0.45))
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .listRowBackground(Color.backgroundIMC)
    }
}

#Preview {
    SuperHeroItem(
        superHero: HeroItem(
            appearance: nil,
            biography: nil,
            connections: nil,
            id: "1",
            image: ImageStruct(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5fZjhMpalhzjJakHl_AOJ5BxAQODWzSbjs8PFazgzTg&s"),
            name: "Spider-Man",
            powerstats: nil,
            work: nil
        )
    )
}
