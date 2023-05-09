//
//  MatchGame.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

import Foundation

struct MatchGame: Codable {
    let fixture: Fixture?
    let goals: Goals?
    let league: League?
    let wscGame: WscGame?
    let score: Score?
    let storifyMeHandle: String?
    let storifyMeID: Int?
    let teams: MatchTeams?
    let wscGameID: String?

    enum CodingKeys: String, CodingKey {
        case fixture, goals, league, wscGame, score, storifyMeHandle, storifyMeID, teams
        case wscGameID = "WSCGameId"
    }
}


