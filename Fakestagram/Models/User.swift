//
//  User.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String { return UUID().uuidString }
    let name: Name
    let picture: Picture
    let likes: Int?
    let message: String?
    let image: String?

    enum CodinKeys: String, CodingKey {
        case name
        case picture
        case likes
        case message
        case image
    }
    
    var urlImageThumbnail: URL? {
        return URL(string: picture.thumbnail)
    }
    
    var urlImagePost: URL? {
        let stringURL = "https://picsum.photos/600?image=\(Int.random(in: 0...100))"
        return URL(string: image ?? stringURL)
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

extension User {
    static let mockUsers = [
        User(name: Name(firstName: "Rubbermaid", lastName: "Laverde"), picture: Picture(large: "", thumbnail: ""), likes: 100, message: "Hello world", image: nil),
        User(name: Name(firstName: "Andrés", lastName: "Rojas"), picture: Picture(large: "", thumbnail: ""), likes: 200, message: "River Plate", image: nil),
        User(name: Name(firstName: "Daniel", lastName: "Cardona"), picture: Picture(large: "", thumbnail: ""), likes: 300, message: "Hello World", image: nil)
    ]
}
