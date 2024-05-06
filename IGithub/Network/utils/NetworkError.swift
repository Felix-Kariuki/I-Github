//
//  NetworkError.swift
//  IGithub
//
//  Created by Felix kariuki on 04/04/2024.
//

import Foundation

/**
 * The Network Error that inherits from `Error` used for handling network related errors
 */

enum NetworkError: Error {
    
    /**
     * A failed request that i non 200 status code and not among the defined errors
     */
    case failure(Data,HTTPURLResponse)
    
    /**
     * Non HTTP response returned
     */
    case invalidResponse
    
    /**
     * Invalid Request URL
     */
    case invalidURL
    
    /**
     * Failed to decode the expected data
     */
    case invalidData
    
    /**
     * Other Networking errors that may occur
     */
    case other(Error)
}
