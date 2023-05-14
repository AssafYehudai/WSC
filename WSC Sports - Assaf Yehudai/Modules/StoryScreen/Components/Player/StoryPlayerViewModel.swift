//
//  StoryPlayerViewModel.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 14/05/2023.
//

import Foundation
import Combine

class StoryPlayerViewModel: ObservableObject {
    
    // MARK: - Properties
    private var cache = VideoCache()
    private var pages: [Page]?
    private var count: Int { return pages?.count ?? 0 }
    
    @Published var currentVideoPath: URL!
    @Published var currentPageIndex: Int! {
        didSet { fetchPath(for: currentPageIndex) }
    }
    
    init(pages: [Page]?) {
        self.pages = pages
        currentPageIndex = 0
    }
    
    func move(forward: Bool) {
        guard forward else {
            currentPageIndex = (currentPageIndex == 0) ? 0 : currentPageIndex - 1
            return
        }
        guard currentPageIndex < count - 1 else { return }
        currentPageIndex += 1
    }
    
    func prefetchNext() {
        guard currentPageIndex < count - 1 else { return }
        Task {
            let _ = await fetchFile(with: currentPageIndex + 1)
        }
    }
    
    private func fetchPath(for index: Int) {
        Task {
            guard let path = await fetchFile(with: index) else { return }
            currentVideoPath = path
        }
    }
    
    private func fetchFile(with index: Int) async -> URL? {
        guard
            let page = pages?[index],
            let videoURL = page.videoURL
        else { return nil }
        return await cache.getFilePath(for: videoURL)
    }
}

