//
//  User.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String = UUID().uuidString
    let name: Name
    let picture: Picture

    enum CodinKeys: String, CodingKey {
        case name
        case picture
    }
}

struct Name: Codable {
    let firstName: String
    let lastName: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
}

struct Picture: Codable {
    let large: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case large
        case thumbnail
    }
}
