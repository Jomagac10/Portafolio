//
//  SuperHeroSearcher.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import SwiftUI

struct SuperHeroSearcher: View {
    @State var name: String = ""
    @State var resultSearch: [HeroItem] = []
    @State var loading: Bool = false
    var body: some View {
        VStack{
            
            TextField("", text: $name, prompt: Text("Superhero...").foregroundStyle(.gray))
                .foregroundStyle(.white)
                .font(.title2)
                .bold()
                .padding(15)
                .border(.purple, width: 5)
                .padding(8)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    Task{
                        do{
                            let response = try await APINetwork().getHeroesByQuery(query: name)
                            guard let results = response.results else { return}
                            self.resultSearch = results
                            print("\(response)")
                        } catch {
                            print("An error occurred: \(error)")
                        }
                        loading = false
                    }
                    
                }
            if loading{
                ProgressView().tint(.white)
            }
            NavigationStack{
                List(resultSearch) { result in
                    ZStack{
                        SuperHeroItem(superHero: result)
                        NavigationLink(destination: SuperHeroDetail(id: result.id ?? "")){
                            EmptyView().opacity(0)
                        }
                    }.listRowBackground(Color.backgroundIMC)
                    
    //                ForEach(resultSearch, id: \.name) { result in
    //                    Text(result.name ?? "")
    //                }
                }.listStyle(.plain)
                
            }
            
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundIMC)
    }
}


#Preview {
    SuperHeroSearcher()
}


