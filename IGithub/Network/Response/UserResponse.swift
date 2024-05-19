//
//  UserResponse.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let login: String? = nil
    let id: Int? = nil
    let nodeID: String? = nil
    let avatarURL: String? = nil
    let gravatarID: String? = nil
    let url: String? = nil
    let   htmlURL: String? = nil
    let    followersURL: String? = nil
    let followingURL:String? = nil
    let     gistsURL:String? = nil
    let starredURL: String? = nil
    let subscriptionsURL:String?  = nil
    let organizationsURL:String? = nil
    let reposURL: String? = nil
    let eventsURL: String? = nil
    let receivedEventsURL: String? = nil
    let type: String? = nil
    let siteAdmin: Bool? = nil
    let name: String? = nil
    let blog: String? = nil
    let location:String? = nil
        let email: String? = nil
    let bio: String? = nil
    let twitterUsername: String? = nil
    let publicRepos:Int? = nil
    let publicGists:Int? = nil
    let followers:Int? = nil
    let following: Int? = nil
    let createdAt:Date? = nil
    let updatedAt: Date? = nil
    let privateGists:Int? = nil
    let totalPrivateRepos:Int? = nil
    let ownedPrivateRepos:Int? = nil
    let diskUsage: Int? = nil
    let collaborators: Int? = nil
    let twoFactorAuthentication: Bool? = nil
    let plan: Plan? = nil
    
    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case name, blog, location, email, bio
        case twitterUsername = "twitter_username"
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case followers, following
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case privateGists = "private_gists"
        case totalPrivateRepos = "total_private_repos"
        case ownedPrivateRepos = "owned_private_repos"
        case diskUsage = "disk_usage"
        case collaborators
        case twoFactorAuthentication = "two_factor_authentication"
        case plan
    }
}

// MARK: - Plan
struct Plan: Codable {
    let name: String?
    let space, collaborators, privateRepos: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, space, collaborators
        case privateRepos = "private_repos"
    }
}


extension UserResponse: Hashable {
    static func ==(lhs: UserResponse, rhs: UserResponse) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


// MARK: - Users /followers /following

typealias Users = [UserResponse]

