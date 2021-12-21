//
//  VideoControls.swift
//  YouTubeMiniPlayer
//
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//

import SwiftUI

struct VideoControls: View {
    @EnvironmentObject var player: VideoPlayerViewModel
    @Environment (\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 15) {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 150, height: 70)

            VStack(alignment: .leading, spacing: 6, content: {
                Text("A Night to Remember Launch Cinematic - The Witcher III: Wild Hunt")
                    .font(.callout)
                    .foregroundColor(colorScheme == .light ? .black : .white)
                    .lineLimit(1)

                Text("CD Project Red")
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundColor(.gray)
            })

            Button(action: {
                
                player.isMiniPlayer.toggle()
            }, label: {
                Image(systemName: "arrow.up")
                    .font(.title2)
                    .foregroundColor(colorScheme == .light ? .black : .white)
            })

            Button(action: {
                player.showPlayer.toggle()
                player.offset = 0
                player.isMiniPlayer.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(colorScheme == .light ? .black : .white)
            })
        }
        .padding(.trailing)
    }
}
