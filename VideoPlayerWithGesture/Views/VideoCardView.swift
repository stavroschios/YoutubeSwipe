//
//  VideoCardView.swift
//  VideoPlayerWithGesture
//
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//

import SwiftUI

struct VideoCardView: View {
    var video: Video
    @Environment (\.colorScheme) var colorScheme

    var body: some View {
        VStack(spacing: 10) {
            Image(video.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250)

            HStack(spacing: 15) {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)

                VStack(alignment: .leading, spacing: 6, content: {
                    Text(video.title)
                        .fontWeight(.semibold)
                        .font(.callout)

                    HStack {
                        Text("CD Project Red")
                            .fontWeight(.bold)
                            .font(.caption)

                        Text(".12K Views.5 Days Ago")
                            .font(.caption)

                    }
                    .foregroundColor(colorScheme == .light ? Color.white : Color.black)
                })
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding(.horizontal)
    }
}

struct VideoCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
