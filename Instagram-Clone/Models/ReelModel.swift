//
//  ReelModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct ReelModel: Identifiable {
    let id: Int
    let username: String
    let userImage: String
    let topProfiles: [String] 
    let videoName: String
    let likeCount: Int
    let commentCount: Int
    let shareCount: Int
    let watchCount: Int
    let isFollowing: Bool
    let audioTitle: String
    let description: String
    let isLiked: Bool
}
