//
//  HomeInteractor.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//


import Foundation

final class HomeInteractor: HomeProvider {
    weak var output: HomeOutput?
    
    func fetchData(){
        if let dogs = HelperManager().getData(){
            self.output?.showData(out: dogs)
        }else{
            fetchExternal()
        }
    }
    
    
    func fetchExternal(){
        let urlString = "https://fakestoreapi.com/products"
        let request = URLRequest(url: URL(string: urlString)!)
        let session = URLSession.shared

        session.dataTask(with: request) {data, response, error in
            //ShowError
            if let error = error {
                print(error.localizedDescription)
                return
            }
            //Decode data recovered
            if let data = data{
                do {
                    DispatchQueue.main.async {
                        print(String(decoding: data, as: UTF8.self))
                        let items: [Item]? = try? JSONDecoder().decode([Item].self, from: data)
                        HelperManager().saveData(items: items)
                        self.output?.showData(out: items)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            }
            
        }.resume()
    }
}
