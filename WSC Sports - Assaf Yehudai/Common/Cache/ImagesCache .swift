//
//  ImagesCache.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit

class ImagesCache {
    
    private var cache: URLCache
    static let shared = ImagesCache()
    
    init(cache: URLCache = .shared) {
        self.cache = cache
    }
    
    func loadImage(url: URL) async -> UIImage? {
        let request = URLRequest(url: url)
        guard let response = cache.cachedResponse(for: request) else {
            return await downladImage(request: request)
        }
        return UIImage(data: response.data)
    }
    
    private func downladImage(request: URLRequest) async -> UIImage? {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
            return UIImage(data: data)
        } catch {
            print("Image fetch: \(error)")
            return nil
        }
    }
}
