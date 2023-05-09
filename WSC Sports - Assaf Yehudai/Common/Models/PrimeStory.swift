//
//  PrimeStory.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

struct PrimeStory: Codable {
    let title: String?
    let storyThumbnailSquare: String?
    let publishDate: String?
    let storyThumbnail: String?
    let storyID: String?
    let pages: [Page]?

    enum CodingKeys: String, CodingKey {
        case title, storyThumbnailSquare, publishDate, storyThumbnail
        case storyID = "storyId"
        case pages
    }
}
