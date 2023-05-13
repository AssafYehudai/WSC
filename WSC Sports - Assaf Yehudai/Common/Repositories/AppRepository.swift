//
//  AppRepository.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation
import Combine

class AppRepository: ObservableObject {
    
    @Published var matches = [MatchGame]()
    private var matchesProvider: MatchesProvider
    
    init(matchesProvider: MatchesProvider) {
        self.matchesProvider = matchesProvider
    }
    
    func fetchMatches() {
        switch matchesProvider.fetch() {
        case .success(let newMatches):
            matches = newMatches.filter { $0.wscGame?.primeStory != nil }
        case .failure(let error):
            print(error)
        }
    }
    
    func getStoryPages(for matchId: String) -> [Page]? {
        let match = matches.first(where: { $0.id == matchId })
        return match?.wscGame?.primeStory?.pages
    }
}
