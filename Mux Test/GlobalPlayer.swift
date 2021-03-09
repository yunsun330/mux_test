//
//  GlobalPlayer.swift
//  Mux Test
//
//  Created by Master on 2021/3/9.
//

import UIKit
import MuxCore
import MUXSDKStatsTHEOplayer
import THEOplayerSDK

class GlobalPlayer {
    static let sharedInstance = GlobalPlayer()
    
    static let environmentKey = "ov4u9j9051f5t9t6f3eol9t3q"
    static let streamUrl = "https://stream.mux.com/mGtoZHVQht2V0200uIklebTZ00WaZ5sHMGZ8Grs1SYlvdA.m3u8"

    var player: THEOplayer!
    var parentView: UIView?

    init() {
        let playerName = "Yun Player"

        self.player = THEOplayer(configuration: THEOplayerConfiguration(chromeless: false))

        let typedSource = TypedSource(
            src: GlobalPlayer.streamUrl,
            type: "application/vnd.apple.mpegurl")
        let source = SourceDescription(source: typedSource, ads: nil, textTracks: nil, poster: nil, analytics: nil, metadata: nil)
        self.player.source = source

        // TODO: Add your env key
        let playerData = MUXSDKCustomerPlayerData(environmentKey: GlobalPlayer.environmentKey)!

        let videoData = MUXSDKCustomerVideoData()
        videoData.videoTitle = "This is a test video"
        videoData.videoId = "yuntest"
        videoData.videoSeries = "animation"

        MUXSDKStatsTHEOplayer.monitorTHEOplayer(self.player, name: playerName, playerData: playerData, videoData: videoData, softwareVersion: "1.1.1")
    }
}
