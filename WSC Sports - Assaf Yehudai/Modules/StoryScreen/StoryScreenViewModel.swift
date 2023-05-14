//
//  StoryScreenViewModel.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation
import AVFoundation

class StoryScreenViewModel {

    private var repo: AppRepository
    private var matchId: String
    
    init(repo: AppRepository, matchId: String) {
        self.repo = repo
        self.matchId = matchId
    }
    
    func getPages() -> [Page]? {
        return repo.getStoryPages(for: matchId)
    }
    
    func getDurations() -> [Double]? {
        return getPages()?.map { Double($0.duration/1000) }
    }
}
