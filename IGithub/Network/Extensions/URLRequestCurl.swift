//
//  URLRequestCurl.swift
//  IGithub
//
//  Created by Felix kariuki on 06/04/2024.
//

import Foundation


extension URLRequest {
    /**
     Returns a cURL command representation of this URL request.
     */
    public func getCurlString(
        hideToken: Bool = true,
        insecure: Bool = true
    ) -> String {
        guard let url = url else { return "" }
        
        var baseCommand = "curl \(insecure ? "--insecure ": " ")\"\(url.absoluteString)\""
        
        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        
        var command = [baseCommand]
        
        if let method = httpMethod, method != "GET", method != "HEAD" {
            command.append("-X \(method)")
        }
        
        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                if key.contains("Auth"), hideToken {
                    command.append("-H \"\(key): \(value.prefix(10))...\(value.suffix(6))\"")
                } else {
                    command.append("-H \"\(key): \(value)\"")
                }
            }
        }
        
        if let data = httpBody, var body = String(data: data, encoding: .utf8) {
            body = body.replacingOccurrences(of: "\"", with: "\\\"")
            command.append("-d \"\(body)\"")
        }
        
        return command.joined(separator: " \\\n\t")
    }
}
