//
//  ProfileModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct ProfileModel {
    let username: String
    let name: String
    let postCount: Int
    let followerCount: Int
    let followingCount: Int
    let userImage: String
    let bio: String
    let link: String
    let music: String
    let musicArtist: String
    let posts: [PostModel]
    let reels: [ReelModel]
    let taggedPost: [PostModel]
    let highlights: [HighlightModel]
}
