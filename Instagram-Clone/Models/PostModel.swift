//
//  PostModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct PostModel: Identifiable {
    let id: Int
    let username: String
    let userImage: String
    let postImages: [String]
    let likesCount: Int
    let likedBy: String
    let shareCount: Int
    let caption: String
    let commentCount: Int
    let postDate: String
    let subInfo: String
    let isLiked: Bool
    let isAuthentic: Bool
}
