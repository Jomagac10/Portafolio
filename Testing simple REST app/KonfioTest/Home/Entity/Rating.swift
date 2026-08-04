//
//  Rating.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 25/04/25.
//

struct Rating : Codable{
    let rate: Float
    let count: Int
    
    init(rate: Float, count: Int) {
        self.rate = rate
        self.count = count
    }
    
}
