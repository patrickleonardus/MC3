//
//  OpenDota.swift
//  ESportMC3
//
//  Created by Beny Untoro on 03/09/19.
//  Copyright © 2019 Patrick Leonardus. All rights reserved.
//

import Foundation

struct WinLose: Codable {
    var win: Int?
    var lose: Int?
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - WelcomeElement
struct Match: Codable {
    var matchID, playerSlot: Int
    var radiantWin: Bool?
    var duration, gameMode, lobbyType, heroID: Int
    var startTime: Int
    var version: Int?
    var kills, deaths, assists: Int
    var skill: Int?
    var leaverStatus: Int
    var partySize: Int?
    
    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case playerSlot = "player_slot"
        case radiantWin = "radiant_win"
        case duration
        case gameMode = "game_mode"
        case lobbyType = "lobby_type"
        case heroID = "hero_id"
        case startTime = "start_time"
        case version, kills, deaths, assists, skill
        case leaverStatus = "leaver_status"
        case partySize = "party_size"
    }
}

typealias Matches = [Match]

// MARK: - Totals
struct Total: Codable {
    var field: String
    var n: Int
    var sum: Double
}

typealias Totals = [Total]

// MARK: - recentMatch
struct RecentMatch: Codable {
    let matchID, playerSlot: Int
    let radiantWin: Bool
    let duration, gameMode, lobbyType, heroID: Int
    let startTime, version, kills, deaths: Int
    let assists: Int
    let skill: JSONNull?
    let xpPerMin, goldPerMin, heroDamage, towerDamage: Int
    let heroHealing, lastHits, lane, laneRole: Int
    let isRoaming: Bool
    let cluster, leaverStatus, partySize: Int
    
    enum CodingKeys: String, CodingKey {
        case matchID = "match_id"
        case playerSlot = "player_slot"
        case radiantWin = "radiant_win"
        case duration
        case gameMode = "game_mode"
        case lobbyType = "lobby_type"
        case heroID = "hero_id"
        case startTime = "start_time"
        case version, kills, deaths, assists, skill
        case xpPerMin = "xp_per_min"
        case goldPerMin = "gold_per_min"
        case heroDamage = "hero_damage"
        case towerDamage = "tower_damage"
        case heroHealing = "hero_healing"
        case lastHits = "last_hits"
        case lane
        case laneRole = "lane_role"
        case isRoaming = "is_roaming"
        case cluster
        case leaverStatus = "leaver_status"
        case partySize = "party_size"
    }
}

typealias RecentMatches = [RecentMatch]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
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

