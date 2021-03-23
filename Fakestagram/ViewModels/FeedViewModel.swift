//
//  FeedViewModel.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation
    
class FeedViewModel: ObservableObject {
    
    @Published var users = [User]()
    @Published var posts = [Post]()
    
    let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getUsers() {
        dataService.getUsers { [weak self] users in
            guard let strongSelf = self else { return }
            strongSelf.users = users
        }
    }
    
    func getPosts() {
        dataService.getPosts { [weak self] posts in
            guard let strongSelf = self else {return}
            strongSelf.posts = posts
        }
    }    
}
