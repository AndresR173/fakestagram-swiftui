//
//  PostsResponse.swift
//  Fakestagram
//
//  Created by Sebastian Muller on 23/03/2021.
//

import Foundation

struct PostsResponse: Codable {
    let results: [Post]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    
}
