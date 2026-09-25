//
//  APINetwork.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import Foundation

class APINetwork{
    
    let urlBase: String = "https://superheroapi.com/api/2acc49c18e1504d7d6cce173e6695c82/search/"
    
    func getHeroesByQuery(query: String) async throws -> Wrapper{
        guard let url: URL = URL(string: urlBase.appending(query)) else { return Wrapper()}
        let (data, _) = try await URLSession.shared.data(from: url)
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
}
