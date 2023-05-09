//
//  Page.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct Page: Codable {
    let duration: Int?
    let paggeID: String?
    let videoURL: String?
    let title: String?
    let awayScore: Int?
    let eventType: EventType?
    let gameClock: String?
    let homeScore: Int?
    let rating: Int?
    let period, actionType: String?

    enum CodingKeys: String, CodingKey {
        case duration
        case paggeID = "paggeId"
        case videoURL = "videoUrl"
        case title, awayScore, eventType, gameClock, homeScore, rating, period, actionType
    }
}
