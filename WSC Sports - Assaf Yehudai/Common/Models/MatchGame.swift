//
//  MatchGame.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

import Foundation

struct MatchGame: Codable, Hashable {
  
    let fixture: Fixture?
    let goals: Goals?
    let league: League?
    let wscGame: WscGame?
    let score: Score?
    let storifyMeHandle: String?
    let storifyMeID: Int?
    let teams: MatchTeams?
    let id: String

    enum CodingKeys: String, CodingKey {
        case fixture, goals, league, wscGame, score, storifyMeHandle, storifyMeID, teams
        case id = "WSCGameId"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MatchGame, rhs: MatchGame) -> Bool {
        return lhs.id == rhs.id
    }
}


