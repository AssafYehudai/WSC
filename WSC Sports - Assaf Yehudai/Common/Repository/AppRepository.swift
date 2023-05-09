//
//  AppRepository.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

class AppRepository {
    
    private var matches: [MatchGame]?
    
    func fetchMatches() {
        guard let path = Bundle.main.path(forResource: "Matches", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            let decoder = JSONDecoder()
            let objects = try decoder.decode([MatchGame].self, from: data)
            matches = objects.filter { $0.wscGame?.primeStory != nil }
        } catch {
            print(error)
        }
    }
}
