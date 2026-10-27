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






//////////////////////////////////////////////////////
//MARK: - Second consumption
struct HeroDetail: Codable, Identifiable{
    var response: String?
    var id: String?
    var name: String?
    var powerstats: PowerStats?
    var biography: BiographyDetail?
    var appearance: AppearanceDetail?
    var work: WorkDetail?
    var connections: Connections?
    var image: HeroImage?
    
    private enum CodingKeys: String, CodingKey {
        case response
        case id
        case name
        case powerstats
        case biography
        case appearance
        case work
        case connections
        case image
    }
}

struct PowerStats: Codable {
    var intelligence: String?
    var strength: String?
    var speed: String?
    var durability: String?
    var power: String?
    var combat: String?
    
    
    var asArray: [(label: String, value: String)] {
        [
            ("Intelligence", intelligence),
            ("Strength", strength),
            ("Speed", speed),
            ("Durability", durability),
            ("Power", power),
            ("Combat", combat)
        ]
        .compactMap { label, value in
            guard let value else { return nil }
            return (label, value)
        }
    }
}

struct BiographyDetail: Codable {
    var fullName: String
    var alterEgos: String
    var aliases: [String]
    var placeOfBirth: String
    var firstAppearance: String
    var publisher: String
    var alignment: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }
}

struct AppearanceDetail: Codable {
    var gender: String
    var race: String
    var height: [String]
    var weight: [String]
    var eyeColor: String
    var hairColor: String

    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

struct WorkDetail: Codable {
    var occupation: String
    var base: String
}

struct Connections: Codable {
    var groupAffiliation: String
    var relatives: String

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

struct HeroImage: Codable {
    var url: String
}
