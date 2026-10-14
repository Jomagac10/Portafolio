//
//  Entities.swift
//  Swift UI Project
//
//  Created by Jose Manuel Garcia Chavez on 25/09/26.
//

import Foundation

struct Wrapper: Codable{
    var response: String?
    var resultsFor: String?
    var results: [HeroItem]?

    private enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}

struct HeroItem: Codable, Identifiable{
    var appearance : Appearance?
    var biography : Biography?
    var connections : Connection?
    var id : String?
    var image : ImageStruct?
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

    private enum CodingKeys: String, CodingKey {
        case eyecolor = "eye-color"
        case gender
        case haircolor = "hair-color"
        case height
        case race
        case weight
    }
}

struct ImageStruct: Codable{
    var url : String?
}

struct Biography: Codable{
    var aliases : [String]?
    var alignment : String?
    var alteregos : String?
    var firstappearance : String?
    var fullname : String?
    var placeofbirth : String?
    var publisher : String?

    private enum CodingKeys: String, CodingKey {
        case aliases
        case alignment
        case alteregos = "alter-egos"
        case firstappearance = "first-appearance"
        case fullname = "full-name"
        case placeofbirth = "place-of-birth"
        case publisher
    }
}

struct Connection: Codable{
    var groupaffiliation : String?
    var relatives : String?

    private enum CodingKeys: String, CodingKey {
        case groupaffiliation = "group-affiliation"
        case relatives
    }
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
