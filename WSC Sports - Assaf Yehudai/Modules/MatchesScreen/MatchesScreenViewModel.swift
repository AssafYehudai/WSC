//
//  MatchesScreenViewModel.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import Foundation

class MatchesScreenViewModel {
    
    private weak var repo: AppRepository!
    
    init(repo: AppRepository) {
        self.repo = repo
        repo.fetchMatches()
    }
}
