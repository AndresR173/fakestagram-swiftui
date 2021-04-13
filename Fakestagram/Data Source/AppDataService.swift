//
//  AppDataService.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 12/03/21.
//

import Foundation
import Combine

enum ApiError: Swift.Error {
    case network(urlError: URLError)
    case parsing(apiResponse: ApiErrorResponse)
    case unknown(urlResponse: URLResponse)
}

struct ApiErrorResponse: Codable {
    let code: Int
    let message: String
}

protocol DataService {
    func getUsers() -> AnyPublisher<Result<Response, ApiError>, Never>
}

class AppDataService: DataService {
    
    private let url = URL(string: "https://randomuser.me/api/?results=10")
    
    func getUsers() -> AnyPublisher<Result<Response, ApiError>, Never> {
        let request = URLRequest(url: url!)
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .map { (data, response) -> Result<Response, ApiError> in
                if let users = try? JSONDecoder().decode(Response.self, from: data) {
                    return .success(users)
                }
                else if let apiResponse = try? JSONDecoder().decode(ApiErrorResponse.self, from: data){
                    return .failure(ApiError.parsing(apiResponse: apiResponse))
                }
                else {
                    return .failure(ApiError.unknown(urlResponse: response))
                }
            }
            .catch {
                Just(Result.failure(ApiError.network(urlError:$0)))                
            }
            .eraseToAnyPublisher()
    }
}

