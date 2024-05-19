//
//  GetFollowersRepo.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation

import Combine

protocol GetFollowersRepo  {

    func getFollowers(from endpoint: IGithubApiService) -> AnyPublisher<Users,APIError>
}

struct GetFollowersRepoImpl : GetFollowersRepo {
    
    func getFollowers(from endpoint: IGithubApiService) -> AnyPublisher<Users, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap{data,response-> AnyPublisher<Users,APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode){
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type:  Users.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                }else {
                    print("ERROR..... \(response.description)   \(response.description) \(endpoint.urlRequest)")
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    

}

