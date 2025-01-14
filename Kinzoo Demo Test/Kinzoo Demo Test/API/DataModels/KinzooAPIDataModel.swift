//
//  DataModel.swift
//  Kinzoo Demo Test
//
//  Created by Bhumit Muchhadia on 2023-10-30.
//

import Foundation


// main character model
struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Location: Codable {
    let name: String
    let url: String
}

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
}
