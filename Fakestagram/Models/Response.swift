//
//  Response.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation

struct Response: Codable {
    let results: [User]

    enum CodingKeys: String, CodingKey {
        case results
    }
}
