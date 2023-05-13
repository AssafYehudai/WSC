//
//  StoryPlayerView.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit
import AVFoundation

class StoryPlayerView: UIView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let videoURL = URL(string: "https://wsczoominwestus.prod-cdn.clipro.tv/editor/98b5c48d-2098-4bda-8ab8-346d571cbb54.mp4")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = bounds
        layer.addSublayer(playerLayer)
        player.play()
    }
}
