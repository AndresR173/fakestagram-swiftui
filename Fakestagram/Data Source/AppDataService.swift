//
//  AppDataService.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 12/03/21.
//

import Foundation

protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
    func getPosts(completion: @escaping ([Post]) -> Void)
}

class AppDataService: DataService {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let url = Bundle.main.url(forResource: "posts_response", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let response = try! JSONDecoder().decode(PostsResponse.self, from: data)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(response.results)
        }
    }
    
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        let url = Bundle.main.url(forResource: "response", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let response = try! JSONDecoder().decode(Response.self, from: data)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(response.results)
        }
    }
    
    
}
