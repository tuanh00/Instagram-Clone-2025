//
//  ProfilePostView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-03.
//

import SwiftUI

struct ProfilePostView: View {
    let posts: [PostModel]
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(posts) {
                    post in
                    ZStack(alignment: .topTrailing) {
                        Image(post.postImages[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 3, height: (UIScreen.main.bounds.width / 2.5) * 1.2)
                            .clipped()
                        
                            //show icon if post has more than 2
                        if post.postImages.count > 1 {
                            Image(systemName: "square.fill.on.square.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.black.opacity(0.6))
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .padding(4)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilePostView(posts : [
        PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3","post_2"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true),
        PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true),
        PostModel(id: 3, username: "june", userImage: "profile_self", postImages: ["post_3_c","post_2"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true),
        PostModel(id: 4, username: "june", userImage: "profile_self", postImages: ["post_1","post_2"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true)
    ])
}
