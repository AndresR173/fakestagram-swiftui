//
//  AppDataService.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 12/03/21.
//

import Foundation

protocol DataService {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class AppDataService: DataService {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        let url = Bundle.main.url(forResource: "response", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let response = try! JSONDecoder().decode(Response.self, from: data)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(response.results)
        }
    }
}
