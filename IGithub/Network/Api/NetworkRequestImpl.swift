//
//  NetworkRequestImpl.swift
//  IGithub
//
//  Created by Felix kariuki on 04/04/2024.
//

import Foundation

/**
 *Implementation of the `NetworkRequest`
 */

struct NetworkRequestImpl:NetworkRequest {
    
    public var dump: Bool = true
    
    private let urlSession: URLSession
    private let environment: Environment
    
    
    // MARK: - Initializers
    
    public init(
        urlSession: URLSession = URLSession.shared,
        environment: Environment = EnvironmentLive()
    ) {
        self.environment = environment
        self.urlSession = urlSession
    }
    
    func getRequest<T>(endpoint: String, headers: HTTPHeaders, expecting type: T.Type, queryParams: [String : String]?) async -> Result<T, NetworkError> where T : Decodable {
        await request(
            endpoint: endpoint,
            method: .get,
            headers: headers, body: nil,
            expecting: type,
            queryParams: queryParams
        )
    }
    
    
    func postRequest<T>(endpoint: String, headers: HTTPHeaders, body: Data?, expecting type: T.Type, queryParams: [String : String]?) async -> Result<T, NetworkError> where T : Decodable {
        await request(endpoint: endpoint, method: .post, headers: headers, body: body, expecting: type, queryParams: queryParams)
    }
    
    func request<T>(endpoint: String, method: HTTPMethod, headers: HTTPHeaders, body: Data?, expecting type: T.Type, queryParams: [String : String]?) async -> Result<T, NetworkError> where T : Decodable {
        do {
            let urlString = environment.baseURL + endpoint
            
            guard var urlComponents = URLComponents(string: urlString) else {
                return .failure(.invalidURL)
            }
            
            let queryItems = queryParams?.compactMap { (key, value) in
                URLQueryItem(name: key, value: value)
            }
            
            urlComponents.queryItems = queryItems
            
            guard let url = urlComponents.url else {
                return .failure(NetworkError.invalidURL)
            }
            
            return await makeNetworkRequest(
                url: url,
                method: method,
                headers: headers,
                body: body,
                expecting: type)
        }
    }
    
    
    private func makeNetworkRequest<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        headers: HTTPHeaders,
        body: Data? = nil,
        expecting type: T.Type
    ) async -> Result<T, NetworkError> {
        
        do {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            headers.forEach { headerField, value in
                request.addValue(value, forHTTPHeaderField: headerField)
            }
            request.httpBody = body
            
            let (data, response) = try await urlSession.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(NetworkError.invalidResponse)
            }
            
            if dump {
                print("\n\(request.getCurlString(hideToken: false))\n")
            }
            
            guard httpResponse.statusCode >= 200 && httpResponse.statusCode <= 299 else {
                return .failure(NetworkError.failure(data, httpResponse))
            }
            
            if type == String.self && data.count == 0 {
                return .success("" as! T)
            }
            
            let object = try JSONDecoder().decode(type, from: data)
            return .success(object)
        }
        catch {
            if error is DecodingError {
                return .failure(.invalidData)
            }
            return .failure(.other(error))
        }
    }
    
    
}
