//
//  ProfileTaggedPostView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-03.
//

import SwiftUI

struct ProfileTaggedPostView: View {
    let taggedPosts: [PostModel]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(taggedPosts) { post in
                    ZStack(alignment: .topTrailing) {
                        Image(post.postImages[0]) // ✅ Display the first image of each tagged post
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 3, height: (UIScreen.main.bounds.width / 2.5) * 1.2)
                            .clipped()
                        
                        // Show icon if the post has multiple images
                        if post.postImages.count > 1 {
                            Image(systemName: "square.fill.on.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white.opacity(0.9))
                                .padding(6)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileTaggedPostView(taggedPosts: [
        PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3_c","post_1"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "Tagged in a great moment!", commentCount: 5, postDate: "Jan 20, 2025", subInfo: "Awesome view!", isLiked: false, isAuthentic: true),
        PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 90, likedBy: "user2", shareCount: 15, caption: "Best party ever!", commentCount: 2, postDate: "Feb 01, 2025", subInfo: "Tagged post", isLiked: true, isAuthentic: true),
        PostModel(id: 3, username: "june", userImage: "profile_self", postImages: ["post_3","post_2"], likesCount: 150, likedBy: "user3", shareCount: 25, caption: "Throwback memories!", commentCount: 8, postDate: "Dec 12, 2024", subInfo: "Such a nice place!", isLiked: false, isAuthentic: true)
    ])
}
