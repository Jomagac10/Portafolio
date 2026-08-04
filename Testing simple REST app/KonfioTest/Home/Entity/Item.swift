//
//  Item.swift
//
//
//  Created by Jose Manuel Garcia Chavez on 11/11/21.
//

import Foundation

struct Item : Codable{
    var _id: Int?
    var title: String?
    var description: String?
    var category: String?
    var image: String?
    var price: Float?
    var rating: Rating?
    
    init(id: Int, title: String, price: Float, description: String, category: String, image: String, rating: Rating) {
        self._id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
        self.rating = rating
    }
    
}



