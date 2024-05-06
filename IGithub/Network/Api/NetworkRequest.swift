//
//  NetworkRequest.swift
//  IGithub
//
//  Created by Felix kariuki on 04/04/2024.
//

import Foundation

/**
 * `NetworkRequest` Defines different HTTP requests made by the apps Networking service
 * - Authors:
 *     -Felix kariuki
 *
 */
protocol NetworkRequest {
    
    /**
     * Defines `GET` HTTP request
     *
     * - Parameters:
     *         - endpoint: request path to make the request
     *         - headers: list of key-value pairs representing each HTTP header to be passed.
     *         - type: the `Decodable` data  expected type to be returned from the request
     *         - queryParams: optional parameters passed when the requery has query paramaeters
     *
     * - Returns: asynchronous `Result` with decoded generic data  `T` object or a `NetworkError` when the request fails
     */
    
    func getRequest<T:Decodable>(
        endpoint:String,
        headers:HTTPHeaders,
        expecting type: T.Type,
        queryParams:[String:String]?
    ) async -> Result<T,NetworkError>
    
    
    /**
     * Defines `POST` HTTP request
     *
     * - Parameters:
     *         - endpoint: request path to make the  request
     *         - headers: list of key-value pairs representing each HTTP header to be passed.
     *         - type: the `Decodable` data  expected type to be returned from the request
     *         - queryParams: optional parameters passed when the requery has query paramaeters
     *         - body: optional `Data` to be passed during the post HTTP Request
     *
     * - Returns: asynchronous `Result` with decoded generic data  `T` object or a `NetworkError` when the request fails
     */
    func postRequest<T: Decodable>(
        endpoint: String,
        headers: HTTPHeaders,
        body: Data?,
        expecting type: T.Type,
        queryParams: [String: String]?
    ) async -> Result<T, NetworkError>
    
    
    /**
     * Defines  HTTP requests of an URL.
     *
     * - Parameters:
     *         - endpoint: request path to make the  request
     *         - headers: list of key-value pairs representing each HTTP header to be passed.
     *         - type: the `Decodable` data  expected type to be returned from the request
     *         - queryParams: optional parameters passed when the requery has query paramaeters
     *         - body: optional `Data` to be passed during the post HTTP Request
     *         - method: The HTTPMethod type requested
     *
     * - Returns: asynchronous `Result` with decoded generic data  `T` object or a `NetworkError` when the request fails
     */
    func request<T: Decodable>(
        endpoint: String,
        method: HTTPMethod,
        headers: HTTPHeaders,
        body: Data?,
        expecting type: T.Type,
        queryParams: [String: String]?
    ) async -> Result<T, NetworkError>
    
}
