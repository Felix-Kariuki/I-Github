//
//  GetUserRepositoriesRepo.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import Foundation
import Combine

protocol GetUserRepositoriesRepo  {

    func getUserRepositories(from endpoint: IGithubApiService) -> AnyPublisher<Repositories,APIError>
}

struct GetUserRepositoriesRepoImpl : GetUserRepositoriesRepo {
    
    func getUserRepositories(from endpoint: IGithubApiService) -> AnyPublisher<Repositories, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap{data, response -> AnyPublisher<Repositories,APIError> in
                
                
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type:  Repositories.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                }else {
                    print("ERROR..... \(response.statusCode)   \(endpoint.urlRequest)")
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
                
                
            }
            .eraseToAnyPublisher()
    }
    
    
}
