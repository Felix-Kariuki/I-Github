//
//  NetworkEnvironment.swift
//  IGithub
//
//  Created by Felix kariuki on 04/04/2024.
//

import Foundation

protocol Environment {
    
    // MARK: Base Url
    var baseURL: String { get }
    
    
    var userDefaults: UserDefaults { get set }
    
    
    func getEnvironment() -> String
    
    func setEnvironment(_ environment: String)
}

struct EnvironmentLive: Environment {
    init() {}
    var baseURL: String {
        getEnvironment()
    }
    
    var userDefaults: UserDefaults = .standard
}

private extension String {
    static let selectedEnvironment = "selectedEnvironment"
}


extension Environment {
    
    public func getEnvironment() -> String {
        "https://api.github.com"
    }
    
    public func setEnvironment(_ environment: String) {
        userDefaults.set(environment, forKey: .selectedEnvironment)
    }
}
