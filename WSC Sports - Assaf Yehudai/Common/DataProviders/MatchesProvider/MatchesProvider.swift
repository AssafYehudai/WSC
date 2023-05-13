//
//  JSONFetcher.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 10/05/2023.
//

import Foundation

protocol MatchesProvider {
    func fetch() -> Result<[MatchGame], Error>
}


