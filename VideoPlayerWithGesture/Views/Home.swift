//
//  Home.swift
//  VideoPlayerWithGesture
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//
import SwiftUI

struct Home: View {
    @StateObject var headerData = HeaderViewModel()
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    @StateObject var player = VideoPlayerViewModel()

    // Gesture state to avoid drag gesture glitches
    @GestureState var gestureOffset: CGFloat = 0

//    var video: Video
    var body: some View {
        
        ZStack(alignment: .bottom, content: {
            ZStack(alignment: .top, content: {
            // Header view
            HeaderView()
                .zIndex(1)
                .offset(y: headerData.headerOffset)

            // Video view
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15) {
                    ForEach(videos) { video in
                            HomeCollectionView(video: video)
                            .onTapGesture {
                            withAnimation {
                                player.showPlayer.toggle()
                            }
                        }
                        
                    }
                    
                }
                
                
                .padding(.top, 75)
                .overlay(
                    // Geometry reader for getting offset value
                    GeometryReader { reader -> Color in
                        let minY = reader.frame(in: .global).minY
                        DispatchQueue.main.async {
                            // Store initial MinY value
                            if headerData.startMinY == 0 {
                                headerData.startMinY = minY
                            }
                            // Get exact offset value by subtracting current from start
                            let offset = headerData.startMinY - minY

                            if offset > headerData.offset {
                                print("Top")
                                // Same clear bottom offset
                                headerData.bottomScrollOffset = 0
                                // If top, hide header view
                                if headerData.topScrollOffset == 0 {
                                    // Store initially to subtract the maxOffset
                                    headerData.topScrollOffset = offset
                                }

                                let progress = (headerData.topScrollOffset + maxOffset) - offset
                                // All conditions were going to use ternary operator
                                // becuase if we use if else while swiping fast it ignore some conditions
                                let offsetCondition = (headerData.topScrollOffset + maxOffset) >= maxOffset && maxOffset - progress <= maxOffset

                               let headerOffset = offsetCondition ? -(maxOffset - progress) : -maxOffset
                                print(headerOffset)
                                headerData.headerOffset = headerOffset
                            }

                            if offset < headerData.offset {
                                print("Bottom")
                                // If bottom, revelating header view
                                // Clear topScrollValue and set bottom
                                headerData.topScrollOffset = 0
                                if headerData.bottomScrollOffset == 0 {
                                    headerData.bottomScrollOffset = offset
                                }

                                // Move if little bit of screen is swiped down for eg 40 offset
                                withAnimation(.easeOut(duration: 0.25)) {
                                    let headerOffset = headerData.headerOffset
                                    headerData.headerOffset = headerData.bottomScrollOffset >= offset + 40 ? 0 : (headerOffset != maxOffset ? 0 : -headerOffset)
                                }
                            }

                            headerData.offset = offset
                        }
                        return Color.clear
                    }
                       
                    .frame(height: 0)

                    , alignment: .top
                )
            }) // SCROLLVIEW
             
                
            })
//                .edgesIgnoringSafeArea(.bottom)
         
            
         
            // Video player view
            if player.showPlayer {
                MiniPlayer()
                // Move from button
                    .transition(.move(edge: .bottom))
                    .offset(y: player.offset)
                    .offset(y: -50)
                    .gesture(
                        DragGesture()
                            .updating($gestureOffset, body: { value, state, _ in
                                state = value.translation.height
                            })
                            .onEnded(onEnded(value:))
                    )
            } // PLAYER
            
           
        }) // ZSTACK
        
            .onChange(of: gestureOffset, perform: { value in
                onChanged()
            })
            .environmentObject(player)
       
    }

    var maxOffset: CGFloat {
        headerData.startMinY + (edges?.top ?? 0) + 10
    }
    
    func onChanged() {
        if gestureOffset > 0 && !player.isMiniPlayer && player.offset + 70 <= player.height {
            player.offset = gestureOffset
        }
    }

    func onEnded(value: DragGesture.Value) {
        withAnimation(.default) {
            if !player.isMiniPlayer {
                player.offset = 0
                // Close view
                if value.translation.height > UIScreen.main.bounds.height / 3 {
                    player.isMiniPlayer = true
                } else {
                    player.isMiniPlayer = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var edges = UIApplication.shared.windows.first?.safeAreaInsets
var rect = UIScreen.main.bounds
