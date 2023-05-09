//
//  League.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct League: Codable {
    let logo: String?
    let name, round: String?
    let season, id: Int?
    let country: String?
    let flag: String?
}
