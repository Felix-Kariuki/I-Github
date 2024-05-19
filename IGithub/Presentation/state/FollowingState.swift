//
//  FollowingState.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation

enum FollowingState {
    case loading
    case success(results: Users)
    case failed(error:Error)
}

enum UserState {
    case loading
    case success(result: UserResponse)
    case failed(error:Error)
}
