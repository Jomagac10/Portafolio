//
//  SuperHeroDetail.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 20/10/26.
//

import SwiftUI

struct SuperHeroDetail: View {
    let id: String
    @State var resultSearch: HeroDetail = HeroDetail()
    @State var loading: Bool = false
    
    private var imageURL: URL? {
        guard let raw = resultSearch.image?.url
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
        
        VStack{
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
            .frame(height: 400)
            .padding(.top, 10)
            .padding(.horizontal, 20)
            .clipped()
            Spacer()
            
            Text(resultSearch.name ?? "")
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
            Spacer().frame(height: 10)
        }.task {
            do {
                loading = false
                let response = try await APINetwork().getHeroByID(id: id)
                self.resultSearch = response
            }catch{
                loading = false
            }
        }.onSubmit {
            loading = true
        }.frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .padding(.top, 20)
            .background(.backgroundIMC)
    }
}

private var placeholder: some View {
    ZStack {
        Color.gray.opacity(0.2)
        ProgressView()
    }
    .frame(maxWidth: .infinity)
    .frame(height: 200)
}

#Preview {
    SuperHeroDetail(id: "4")
}
