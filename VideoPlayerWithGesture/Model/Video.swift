//
//  Video.swift
//  YouTubeMiniPlayer
//
//
//  Created by Stavros Pachoundakis on 2021-11-29.
//

import SwiftUI

struct Video: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
}

var videos = [
    Video(image: "witcher", title: "A Night to Remember Launch Cinematic - The Witcher III: Wild Hunt"),
    Video(image: "dl2", title: "Dying Light 2 Stay Human - Official Gameplay Trailer"),
    Video(image: "fifa", title: "FIFA 22 | Official Gameplay Trailer"),
    Video(image: "spiderman", title: "SPIDER-MAN: NO WAY HOME - Official Trailer (HD)"),
    Video(image: "lol", title: "League of Legends Season 2021 Ruination Cinematic Trailer"),
]

