//
//  IGithubApi.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import Foundation

protocol ApiBuilder {
    var urlRequest : URLRequest { get }
    var baseUrl : URL { get }
    var path:String { get }
}

let BASE_URL = "https://api.github.com"
let ACCESS_TOKEN = "ACCESS_TOKEN_HERE"

enum IGithubApiService {
    case getUserRepos (userName :String)
    case getUser (userName:String)
    case getUserFollowers (userName:String)
    case getUserFollowing(userName:String)
}

extension IGithubApiService:ApiBuilder {
    
    var urlRequest: URLRequest {
        var request =  URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    
        request.setValue(ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    var baseUrl: URL {
        return URL(string: "\(BASE_URL)")!
    }
    
    var path: String {
        switch self {
        case .getUserRepos(let userName):
            "/users/\(userName)/repos"
        case .getUser(let userName):
            "/users/\(userName)"
        case .getUserFollowers(let userName):
            "/users/\(userName)/followers"
        case .getUserFollowing(let userName):
            "/users/\(userName)/following"
        }
    }
    
    
}
