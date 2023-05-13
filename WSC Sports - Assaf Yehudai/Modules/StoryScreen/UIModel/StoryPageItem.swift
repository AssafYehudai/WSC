//
//  StoryPageItem.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation
import AVFoundation

struct StoryPageItem {
    
    let page: Page
    let asset: AVAsset
}

struct StoryItemsConverter {
    static func convert(pages: [Page]) -> [StoryPageItem] {
        return pages.compactMap {conver(page: $0)}
    }
    
    static func conver(page: Page) -> StoryPageItem? {
        guard
            let stringUrl = page.videoURL,
            let url = URL(string: stringUrl)
        else { return nil }
        return StoryPageItem(page: page, asset: AVAsset(url: url))
    }
}
