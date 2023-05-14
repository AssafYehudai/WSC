//
//  StoryPlayerView.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit
import AVFoundation
import Combine

class StoryPlayerView: UIView, ObservableObject {
    
    // MARK: - Properties
    private var cache = VideoCache()
    private var pages: [Page]?
    private var count: Int { return pages?.count ?? 0 }
    @Published var currentPageIndex: Int! {
        didSet { playCurrentPageIndex() }
    }
    
    // MARK: - UIComponents
    private var playerLayer: AVPlayerLayer?
    private var player: AVPlayer? { return playerLayer?.player }
    private var currentAsset: AVAsset? {
        didSet {
            guard let asset = currentAsset else { return }
            setupAsset(asset: asset)
        }
    }
    
    // MARK: - Constructor
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapSnap)))
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(playerDidFinishPlaying),
                         name: .AVPlayerItemDidPlayToEndTime,
                         object: nil)
    }
    
    // MARK: - Public
    func loadPages(pages: [Page]?) {
        self.pages = pages
        currentPageIndex = 0
    }
    
    // MARK: - Private Helpers
    private func playCurrentPageIndex() {
        Task {
            guard let path = await fetchFile(with: currentPageIndex!) else { return }
            currentAsset = AVAsset(url: path)
        }
    }
    
    private func setupAsset(asset: AVAsset) {
        let item = AVPlayerItem(asset: asset)
        guard player != nil else { setupPlayerLayer(with: item); return }
        player?.replaceCurrentItem(with: item)
        play()
    }
    
    private func setupPlayerLayer(with item: AVPlayerItem) {
        let player = AVPlayer(playerItem: item)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        layer.addSublayer(playerLayer!)
        play()
    }
    
    private func play() {
        player?.play()
        prefetchNext()
    }
    
    private func move(forward: Bool) {
        guard forward else {
            currentPageIndex = (currentPageIndex == 0) ? 0 : currentPageIndex - 1
            return
        }
        guard currentPageIndex < count - 1 else { return }
        currentPageIndex += 1
    }
    
    private func fetchFile(with index: Int) async -> URL? {
        guard
            let page = pages?[index],
            let videoURL = page.videoURL
        else { return nil }
        return await cache.getFilePath(for: videoURL)
    }
    
    private func prefetchNext() {
        guard currentPageIndex < count - 1 else { return }
        Task {
            let _ = await fetchFile(with: currentPageIndex + 1)
        }
    }
    
    // MARK: - Selectors
    @objc func didTapSnap(_ sender: UITapGestureRecognizer) {
        let touchLocation = sender.location(ofTouch: 0, in: self)
        move(forward: touchLocation.x > frame.width/2)
        print("Tapppp -------")
    }
    
    @objc func playerDidFinishPlaying() {
        move(forward: true)
    }
}
