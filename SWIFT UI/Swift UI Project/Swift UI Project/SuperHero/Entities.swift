//
//  Entities.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import Foundation

struct Wrapper: Codable{
    var response: String?
    var results: [Result]?
}

struct Result: Codable{

    var appearance : Appearance?
    var biography : Biography?
    var connections : Connection?
    var id : String?
//    var image : String?
    var name : String?
    var powerstats : Powerstat?
    var work : Work?
}

struct Appearance: Codable{

    var eyecolor : String?
    var gender : String?
    var haircolor : String?
    var height : [String]?
    var race : String?
    var weight : [String]?

}

struct Biography: Codable{

    var aliases : [String]?
    var alignment : String?
    var alteregos : String?
    var firstappearance : String?
    var fullname : String?
    var placeofbirth : String?
    var publisher : String?


}

struct Connection: Codable{

    var groupaffiliation : String?
    var relatives : String?


}

struct Work: Codable{

    var base : String?
    var occupation : String?


}

struct Powerstat: Codable{

    var combat : String?
    var durability : String?
    var intelligence : String?
    var power : String?
    var speed : String?
    var strength : String?


}
