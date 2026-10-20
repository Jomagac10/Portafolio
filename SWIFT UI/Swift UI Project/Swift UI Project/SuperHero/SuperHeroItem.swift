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
        guard let raw = superHero.image?.url?
            .trimmingCharacters(in: .whitespacesAndNewlines),
              !raw.isEmpty else {
            return nil
        }

        let httpsURL = raw.hasPrefix("http://")
            ? "https://" + raw.dropFirst("http://".count)
            : raw

        return URL(string: String(httpsURL))
    }

    var body: some View {
        ZStack(alignment: .bottom) {

            // Imagen de fondo
            AsyncImage(url: imageURL) { phase in
                switch phase {
                case .empty:
                    placeholder

                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()

                case .failure:
                    placeholder
                        .overlay {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)
                        }

                @unknown default:
                    placeholder
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipped()

            // Degradado
//            LinearGradient(
//                colors: [
//                    .black.opacity(0.7),
//                    .clear
//                ],
//                startPoint: .bottom,
//                endPoint: .top
//            )
//            .allowsHitTesting(false)

            // Título siempre encima de la imagen
            Text(superHero.name ?? "")
                .font(.title3.bold())
                .foregroundStyle(.white)
                .lineLimit(1)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(.black.opacity(0.6))
                .shadow(
                    color: .black.opacity(0.8),
                    radius: 4,
                    x: 0,
                    y: 2
                )
        }
        .frame(height: 200)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16,
                style: .continuous
            )
        )
    }

    private var placeholder: some View {
        ZStack {
            Color.gray.opacity(0.2)
            ProgressView()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
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
