//
//  HTTPMethod.swift
//  IGithub
//
//  Created by Felix kariuki on 04/04/2024.
//

import Foundation


/**
 * `HTTPHeaders` is a typealias representing a dictionary of HTTP headers.
 *  It maps header names (as String) to their corresponding values (as String).
 */

typealias HTTPHeaders = [String: String]

/**
 * `HTTPMethod` is an enum representing HTTP request methods.
 */
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}
