//
//  UserResponse.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation

// MARK: - UserResponse
struct UserResponse: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?
    let name: String?
    let company: JSONNull?
    let blog: String?
    let location, email: String?
    let hireable: JSONNull?
    let bio, twitterUsername: String?
    let publicRepos, publicGists, followers, following: Int?
    let createdAt, updatedAt: Date?
    let privateGists, totalPrivateRepos, ownedPrivateRepos, diskUsage: Int?
    let collaborators: Int?
    let twoFactorAuthentication: Bool?
    let plan: Plan?

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
        case name, company, blog, location, email, hireable, bio
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
    
    init(
            login: String? = nil,
            id: Int? = nil,
            nodeID: String? = nil,
            avatarURL: String? = nil,
            gravatarID: String? = nil,
            url: String? = nil,
            htmlURL: String? = nil,
            followersURL: String? = nil,
            followingURL: String? = nil,
            gistsURL: String? = nil,
            starredURL: String? = nil,
            subscriptionsURL: String? = nil,
            organizationsURL: String? = nil,
            reposURL: String? = nil,
            eventsURL: String? = nil,
            receivedEventsURL: String? = nil,
            type: String? = nil,
            siteAdmin: Bool? = nil,
            name: String? = nil,
            company: JSONNull? = nil,
            blog: String? = nil,
            location: String? = nil,
            email: String? = nil,
            hireable: JSONNull? = nil,
            bio: String? = nil,
            twitterUsername: String? = nil,
            publicRepos: Int? = nil,
            publicGists: Int? = nil,
            followers: Int? = nil,
            following: Int? = nil,
            createdAt: Date? = nil,
            updatedAt: Date? = nil,
            privateGists: Int? = nil,
            totalPrivateRepos: Int? = nil,
            ownedPrivateRepos: Int? = nil,
            diskUsage: Int? = nil,
            collaborators: Int? = nil,
            twoFactorAuthentication: Bool? = nil,
            plan: Plan? = nil
        ) {
            self.login = login
            self.id = id
            self.nodeID = nodeID
            self.avatarURL = avatarURL
            self.gravatarID = gravatarID
            self.url = url
            self.htmlURL = htmlURL
            self.followersURL = followersURL
            self.followingURL = followingURL
            self.gistsURL = gistsURL
            self.starredURL = starredURL
            self.subscriptionsURL = subscriptionsURL
            self.organizationsURL = organizationsURL
            self.reposURL = reposURL
            self.eventsURL = eventsURL
            self.receivedEventsURL = receivedEventsURL
            self.type = type
            self.siteAdmin = siteAdmin
            self.name = name
            self.company = company
            self.blog = blog
            self.location = location
            self.email = email
            self.hireable = hireable
            self.bio = bio
            self.twitterUsername = twitterUsername
            self.publicRepos = publicRepos
            self.publicGists = publicGists
            self.followers = followers
            self.following = following
            self.createdAt = createdAt
            self.updatedAt = updatedAt
            self.privateGists = privateGists
            self.totalPrivateRepos = totalPrivateRepos
            self.ownedPrivateRepos = ownedPrivateRepos
            self.diskUsage = diskUsage
            self.collaborators = collaborators
            self.twoFactorAuthentication = twoFactorAuthentication
            self.plan = plan
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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    public var hashValue: Int {
            return 0
    }

    public func hash(into hasher: inout Hasher) {
            // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
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

