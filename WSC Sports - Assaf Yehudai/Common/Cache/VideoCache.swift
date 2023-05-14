//
//  VideoCache.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import Foundation

class VideoCache {
    
    enum DataFetchError: Error {
        case error(Error)
    }
    
    private let fileManager = FileManager.default
    private lazy var mainDirectoryUrl: URL? = {
        let documentsUrl = self.fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first
        return documentsUrl
    }()
    
    func getFilePath(for videoUrl: String) async -> URL? {
        guard let path = directoryPath(for: videoUrl) else { return nil }
        if fileManager.fileExists(atPath: path.path) { return path }
        guard let serverURL = URL(string: videoUrl) else { return nil }
        do {
            let data = try await fethcData(for: serverURL)
            try data.write(to: path)
            return path
        } catch DataFetchError.error(let error) {
            print("Video download error: - \(error)")
            return nil
        } catch {
            print("Saving Video error: - \(error)")
            return nil
        }
    }
    
    // MARK: - Private Helpers
    private func fethcData(for path: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: path)
            return data
        } catch {
            throw(DataFetchError.error(error))
        }
    }
    
    private func directoryPath(for stringUrl: String) -> URL? {
        guard
            let fileURL = URL(string: stringUrl)?.lastPathComponent,
            let mainDirURL = self.mainDirectoryUrl
        else { return nil }
        return mainDirURL.appendingPathComponent(fileURL)
    }
}
