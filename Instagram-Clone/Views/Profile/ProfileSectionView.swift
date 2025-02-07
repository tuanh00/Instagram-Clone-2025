//
//  ProfileSectionView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-03.
//

import SwiftUI

struct ProfileSectionView: View {
    @State private var selectedTab: Int = 0
    
    let profile: ProfileModel
    
    var body: some View {
        NavigationStack { 
            VStack(spacing: 0) {
                
                //header
                VStack(alignment: .leading, spacing: 15) {
                    HStack{
                        Image(systemName: "lock")
                            .foregroundColor(.black)
                        
                        Text(profile.username)
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                        
                        Image(systemName: "chevron.down")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10)
                            .clipped()
                        
                        Spacer()
                        
                        HStack(spacing: 12) {
                            Image(systemName: "plus.app")
                                .font(.system(size: 20))
                            
                            NavigationLink(destination: SettingsView()
                                .navigationBarBackButtonHidden(true) // ✅ Hides back button
                            ) {
                                Image(systemName: "line.3.horizontal")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    
                    HStack(spacing: 15) {
                        Image(profile.userImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(profile.name)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                            HStack(spacing: 20) {
                                //post
                                VStack(alignment: .leading) {
                                    Text("\(profile.postCount)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    Text("posts")
                                }
                                
                                //followers
                                VStack(alignment: .leading) {
                                    Text("\(profile.followerCount)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    Text("followers")
                                }
                                
                                //following
                                VStack(alignment: .leading) {
                                    Text("\(profile.followingCount)")
                                        .fontWeight(.bold)
                                        .font(.system(size: 20))
                                    Text("following")
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        //bio
                        Text(profile.bio)
                        //link
                        HStack() {
                            Image(systemName: "link")
                            Text(profile.link)
                                .truncationMode(.tail)
                                .frame(maxWidth: 210)
                            Spacer()
                        }
                        .foregroundColor(Color.blue.opacity(0.8))
                        .lineLimit(1)
                        .frame(maxWidth: .infinity)
                        
                        //music
                        HStack {
                            Image(systemName: "play.circle")
                                .scaleEffect(1.1)
                                .fontWeight(.bold)
                            
                            Text(profile.music)
                                .fontWeight(.semibold)
                            
                            Text("· \(profile.musicArtist)")
                                .foregroundColor(Color(.gray))
                        }
                        
                        //buttons
                        HStack{
                            Button(action: {}) {
                                Text("Edit profile")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.black))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 34)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            }
                            
                            Button(action: {}) {
                                Text("Share profile")
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(.black))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 34)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            }
                            
                            Button(action: {}) {
                                Image(systemName: "person.badge.plus")
                                    .foregroundColor(Color(.black))
                                    .frame(width: 20, height: 20)
                                    .padding(5)
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                            }
                        }
                    }
                    .padding(.bottom, 10)
                }
                .padding(.horizontal, 10)
                
                // Tab bar
                HStack {
                    Spacer()
                    Button(action: { selectedTab = 0 }) {
                        VStack {
                            Image(systemName: "square.grid.3x3")
                                .font(.title2)
                                .foregroundColor(selectedTab == 0 ? .primary : .gray)
                            if selectedTab == 0 {
                                Rectangle()
                                    .frame(width: 50, height: 2)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { selectedTab = 1 }) {
                        VStack {
                            Image(systemName: "play.square")
                                .font(.title2)
                                .foregroundColor(selectedTab == 1 ? .primary : .gray)
                            if selectedTab == 1 {
                                Rectangle()
                                    .frame(width: 50, height: 2)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: { selectedTab = 2 }) {
                        VStack {
                            Image(systemName: "person.crop.square")
                                .font(.title2)
                                .foregroundColor(selectedTab == 2 ? .primary : .gray)
                            if selectedTab == 2 {
                                Rectangle()
                                    .frame(width: 50, height: 2)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.vertical, 2)
                
                // **Content for selected tab**
                if selectedTab == 0 {
                    ProfilePostView(posts: profile.posts)
                } else if selectedTab == 1 {
                    ProfileReelView(reels: profile.reels)
                } else {
                    ProfileTaggedPostView(taggedPosts: profile.taggedPost)
                }
            }
        }
    }
}



#Preview {
    ProfileSectionView(profile: ProfileModel(username: "june", name: "tuanh265", postCount: 2, followerCount: 10, followingCount: 12, userImage: "profile_self", bio: "nevermind", link: "https://www.youtube.com/watch?v=zED0g_W8WFw", music: "Pink + White", musicArtist: "Frank Ocean", posts: [PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3","post_2"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true), PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "My vacation", commentCount: 5, postDate: "December 24, 2024", subInfo: "Nive view!", isLiked: false, isAuthentic: true)], reels: [ ReelModel(id: 1, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_1", likeCount: 300, commentCount: 20, shareCount: 20, watchCount: 110, isFollowing: true, audioTitle: "Trending sound", description: "Having fun!", isLiked: false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ReelModel(id: 2, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_2", likeCount: 400, commentCount: 50, shareCount: 30, watchCount: 500, isFollowing: false, audioTitle: "Viral Sound", description: "Just vibing!", isLiked: true)], taggedPost: [PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3_c","post_1"], likesCount: 120, likedBy: "user1", shareCount: 20, caption: "Tagged in a great moment!", commentCount: 5, postDate: "Jan 20, 2025", subInfo: "Awesome view!", isLiked: false, isAuthentic: true),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  PostModel(id: 2, username: "june", userImage: "profile_self", postImages: ["post_3_b"], likesCount: 90, likedBy: "user2", shareCount: 15, caption: "Best party ever!", commentCount: 2, postDate: "Feb 01, 2025", subInfo: "Tagged post", isLiked: true, isAuthentic: true)], highlights: []))
}
