//
//  UIMatch.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation

struct UIMatch: Hashable {
   
    let id: String?
    let teams: MatchTeams?
    let homeScore: Int
    let awayScore: Int
    let storyThumbnail: String?
    var isHomeWinner: Bool { homeScore > awayScore }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: UIMatch, rhs: UIMatch) -> Bool {
        return lhs.id == rhs.id
    }
}

struct MatchConverter {
    
    static func conver(matches: [MatchGame]) -> [UIMatch] {
        return matches.map { convert(matchGame: $0) }
    }
    
    static func convert(matchGame: MatchGame) -> UIMatch {
        let homeScore = matchGame.wscGame?.primeStory?.pages?.last?.homeScore ?? 0
        let awayScore = matchGame.wscGame?.primeStory?.pages?.last?.awayScore ?? 0
        let thumbnail = matchGame.wscGame?.primeStory?.storyThumbnail
        return UIMatch(id: matchGame.id,
                       teams: matchGame.teams,
                       homeScore: homeScore,
                       awayScore: awayScore,
                       storyThumbnail: thumbnail)
    }
}
