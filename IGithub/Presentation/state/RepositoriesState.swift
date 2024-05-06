//
//  RepositoriesState.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import Foundation


enum RepositoriesState {
    
    case loading
    case success(results: Repositories)
    case failed(error:Error)
    
}
