//
//  StoryPlayerView.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit
import AVFoundation
import Combine

class StoryPlayer: UIView, ObservableObject {
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Properties
    private var viewModel: StoryPlayerViewModel?
    
    // MARK: - UIComponents
    private var playerLayer: AVPlayerLayer?
    private var player: AVPlayer? { return playerLayer?.player }
    
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
    
    // MARK: - PublicApi
    func setup(viewModel: StoryPlayerViewModel) {
        self.viewModel = viewModel
        viewModel.$currentVideoPath
            .receive(on: DispatchQueue.main)
            .sink {[weak self] path in
                guard let path = path else { return }
                self?.setupAsset(asset: AVAsset(url: path))
            }.store(in: &subscriptions)
    }
    
    // MARK: - Private Helpers
    private func play() {
        player?.play()
        viewModel?.prefetchNext()
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
    
    // MARK: - Selectors
    @objc func didTapSnap(_ sender: UITapGestureRecognizer) {
        let touchLocation = sender.location(ofTouch: 0, in: self)
        viewModel?.move(forward: touchLocation.x > frame.width/2)
    }
    
    @objc func playerDidFinishPlaying() {
        viewModel?.move(forward: true)
    }
}
