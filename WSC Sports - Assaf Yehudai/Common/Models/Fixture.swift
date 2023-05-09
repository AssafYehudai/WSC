//
//  Fixture.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct Fixture: Codable {
    let timezone: String?
    let venue: Venue?
    let referee: String?
    let periods: Periods?
    let id: Int?
    let status: Status?
    let date: String?
    let timestamp: Int?
}
