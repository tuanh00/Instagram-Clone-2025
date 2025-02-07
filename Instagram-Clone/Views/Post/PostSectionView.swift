//
//  PostSectionView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import SwiftUI

struct PostSectionView: View {
    
    //sample data
    let posts: [PostModel] = [
        PostModel(id: 1, username: "marble_p", userImage: "profile_2", postImages: ["post_1", "post_1_b"], likesCount: 1234, likedBy: "Jenny", shareCount: 10, caption: "2024 I'm grateful for u 🥰❤️", commentCount: 12, postDate: "December 31, 2024", subInfo: "🎵 Hilary Duff · What Dreams Are Made Of", isLiked: false, isAuthentic: false),
        PostModel(id: 2, username: "oanhdaqueen", userImage: "profile_3", postImages: ["post_2"], likesCount: 900, likedBy: "helen", shareCount: 2, caption: "Have you made your 2025 vision board yet? 💕🎀", commentCount: 5, postDate: "December 26, 2024", subInfo: "🎵 Hoku · Perfect Day", isLiked: true, isAuthentic: true),
        PostModel(id: 3, username: "vstra__official", userImage: "profile_4", postImages: ["post_3_b", "post_1"], likesCount: 55, likedBy: "lf.tlinh", shareCount: 358, caption: "so much fun, so much love that I don't know how to write a caption", commentCount: 271, postDate: "November 30, 2024", subInfo: "🎵 Drake, Giveon · Chicago Freestyle", isLiked: true, isAuthentic: true)
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(posts) {
                    post in
                    PostCard(post: post)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                }
            }
        }
    }
}

#Preview {
    PostSectionView()
}
