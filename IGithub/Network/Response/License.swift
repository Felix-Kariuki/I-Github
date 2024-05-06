//
//  License.swift
//  IGithub
//
//  Created by Felix kariuki on 06/04/2024.
//

import Foundation

// MARK: - License
struct License: Codable {
    let key: String
    let name: String
    let spdxID: String
    let url: String?
    let nodeID: String

    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}
