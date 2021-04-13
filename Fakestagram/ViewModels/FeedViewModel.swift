//
//  FeedViewModel.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation
import Combine
    
class FeedViewModel: ObservableObject {
    
    @Published var users = [User]()
    var suscriptions = Set<AnyCancellable>()
    
    let dataService: DataService
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getUsers() {
        dataService.getUsers()
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .success:
                    print("Receiving info from network")
                    if let usersResult = try? result.get().results {
                        self.users = usersResult
                    }
                case .failure:
                    print("Something went wrong")
                }
            }.store(in: &suscriptions)
    }
}
