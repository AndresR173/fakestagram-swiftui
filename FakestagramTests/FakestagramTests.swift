//
//  FakestagramTests.swift
//  FakestagramTests
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import XCTest
@testable import Fakestagram

class MockDataService: DataService {
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion([
            User(id: "1", name: Name(firstName: "Kyle", lastName: "Patterson"), picture: Picture(large: "", thumbnail: "")),
            User(id: "2", name: Name(firstName: "Johny", lastName: "Walker"), picture: Picture(large: "", thumbnail: ""))])
    }
}

class FakestagramTests: XCTestCase {
    
    var sut: FeedView.ViewModel!

    override func setUpWithError() throws {
        sut = FeedView.ViewModel(dataService: MockDataService())
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getUsers() throws {
        XCTAssertTrue(sut.users.isEmpty)
        sut.getUsers()
        XCTAssertEqual(sut.users.count, 2)
    }
}
