//
//  Post.swift
//  Fakestagram
//
//  Created by Sebastian Muller on 23/03/2021.
//

import Foundation

struct Post: Codable {
    
    let user : User
    let image : String
    let likes : Int
    let message : String
    
    enum CodingKeys: String, CodingKey {
        case user
        case image
        case likes
        case message
    }
    
    
}
