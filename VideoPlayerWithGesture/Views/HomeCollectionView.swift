//
//  HomeCollectionView.swift
//  VideoPlayerWithGesture
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//  Copyright © 2021 Stavros Pachoundakis. All rights reserved.
//

import SwiftUI

struct HomeCollectionView: View {
    var video: Video

    var body: some View {
        VStack {
            Image(video.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: rect.width - 30, height: 250)
            .cornerRadius(1)

        HStack(spacing: 10) {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 35, height: 35)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4, content: {
                Text(video.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                Text("stavroschios . 4 hours ago")
                    .font(.caption)
                    .foregroundColor(.gray)
            })
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.bottom, 15)
            
    }

    }
}

