//
//  Model.swift
//  Rick and Morty JSON Parcing
//
//  Created by Гаджи Агаханов on 09.06.2021.
//

import Foundation

struct CharacterInfo: Decodable {
    
    let count: Int
    let pages: Int
    let next: String
    let prev: String
}

struct InfoResult: Decodable {
    
    let info: CharacterInfo
    let result: [CharacterStats]
    
}
struct CharacterStats: Decodable {
    
    let id: Int
    let name: String
    let status: RMStatus
    let image: String
    
}

enum RMStatus: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}
