//
//  Character.swift
//  DisneyWorld
//
//  Created by Paweł Kraszewski on 15/09/2022.
//

import Foundation

struct Character: Codable {
    let films: [String]
    let shortFilms: [String]
    let tvShows: [String]
    let videoGames: [String]
    let parkAttractions: [String]
    let allies: [String]
    let enemies: [String]
    let _id: Int
    let name: String
    let imageUrl: String
    let url: String
}

struct CharcterData: Codable {
    let data: [Character]
}
