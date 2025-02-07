//
//  ProfileScreen.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-03.
//

import SwiftUI

struct ProfileScreen: View {
    let profile = ProfileModel(
        username: "june",
        name: "tuanh265",
        postCount: 2,
        followerCount: 10,
        followingCount: 12,
        userImage: "profile_self",
        bio: "nevermind",
        link: "https://www.youtube.com/watch?v=zED0g_W8WFw",
        music: "Pink + White",
        musicArtist: "Frank Ocean",
        posts: [
            PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3", "post_2"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nice view!", isLiked: false, isAuthentic: true),
            PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nice view!", isLiked: false, isAuthentic: true)
        ],
        reels: [
            ReelModel(id: 1, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_1", likeCount: 300, commentCount: 20, shareCount: 20, watchCount: 110, isFollowing: true, audioTitle: "Trending sound", description: "Having fun!", isLiked: false),
            ReelModel(id: 2, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_2", likeCount: 400, commentCount: 50, shareCount: 30, watchCount: 500, isFollowing: false, audioTitle: "Viral Sound", description: "Just vibing!", isLiked: true)
        ],
        taggedPost: [
            PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3_c", "post_1"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "Tagged in a great moment!", commentCount: 5, postDate: "Jan 20, 2025", subInfo: "Awesome view!", isLiked: false, isAuthentic: true),
            PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 90, likedBy: "user2", shareCount: 15, caption: "Best party ever!", commentCount: 2, postDate: "Feb 01, 2025", subInfo: "Tagged post", isLiked: true, isAuthentic: true)
        ],
        highlights: []
    )

    var body: some View {
        ProfileSectionView(profile: profile)
    }
}

#Preview {
    ProfileScreen()
}
