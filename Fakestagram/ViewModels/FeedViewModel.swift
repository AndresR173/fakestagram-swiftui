//
//  FeedViewModel.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import Foundation



protocol FeedViewModel: ObservableObject {
    var results: [User] { get }
    var status: Status { get }
}

final class FeedViewModelImpl: FeedViewModel {
    // MARK: - Properties

    var results: [User] = []
    @Published var status: Status = .loading

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.status = .loaded
            dump(strongSelf.status)
        }
    }
}
