//
//  MatchesJSONProvider.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation

struct MatchesJSONProvider: MatchesProvider {
    func fetch() -> Result<[MatchGame], Error> {
        return JSONFetcher().fetch(jsonName: "Matches")
    }
}

struct JSONFetcher {
    enum JFError: Error {
        case jsonNotFound
        case parsingError(Error)
    }
    
    func fetch<T: Codable>(jsonName: String) -> Result<T, Error> {
        guard let path = Bundle.main.path(forResource: jsonName, ofType: "json") else { return .failure(JFError.jsonNotFound) }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url, options: .dataReadingMapped)
            let decoder = JSONDecoder()
            let objects = try decoder.decode(T.self, from: data)
            return .success(objects)
        } catch {
            return .failure(JFError.parsingError(error))
        }
    }
}
