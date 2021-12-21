//
//  VideoPlayerViewModel.swift
//  YouTubeMiniPlayer
//
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//

import SwiftUI

class VideoPlayerViewModel: ObservableObject {
    // MiniPlayer properties
    @Published var showPlayer = false
    @Published var pauseplayer = false
    // Gesture offset
    @Published var offset: CGFloat = 0
    @Published var width: CGFloat = UIScreen.main.bounds.width
    @Published var height: CGFloat = 0
    @Published var isMiniPlayer = false
}
