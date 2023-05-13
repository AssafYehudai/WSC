//
//  StoryPlayerViewModel.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation
import AVFoundation

class StoryPlayerViewModel {
    
    var currentItemIndex: Int
    var storyItems: [StoryPageItem]
    
    init(pages: [Page]) {
        currentItemIndex = 0
        storyItems = StoryItemsConverter.convert(pages: pages)
    }
    
    
}
