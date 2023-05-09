//
//  WscGame.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct WscGame: Codable {
    let gameTime, homeTeamName, gameID, awayTeamName: String?
    let primeStory: PrimeStory?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case gameTime, homeTeamName
        case gameID = "gameId"
        case awayTeamName, primeStory, name
    }
}
