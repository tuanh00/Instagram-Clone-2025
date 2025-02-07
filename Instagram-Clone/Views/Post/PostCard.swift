//
//  PostCard.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import SwiftUI

struct PostCard: View {
    
    let post: PostModel
    @State private var showTranslation = false
    @State private var currentIndex = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            //Header (user profile and more button)
            HStack{
                Image(post.userImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        Text(post.username)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        if post.isAuthentic {
                            Image(systemName: "checkmark.seal.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                    Text(post.subInfo)
                        .font(.caption)
                        .fontWeight(.regular)
                }
                
                
                Spacer()
                
                Button {
                    //more action
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }//end hstack
            .padding(.horizontal, 8)
            
            //2) post images
            ZStack {
                //swipable images
                TabView(selection: $currentIndex) {
                    ForEach(post.postImages.indices, id: \.self) {
                        i in
                        Image(post.postImages[i])
                            .resizable()
                            .scaledToFit()
                            .tag(i)
                    }
                }
                .frame(height: 300)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                //2) show top-right "1/N"
                if post.postImages.count > 1 {
                    Text("\(currentIndex + 1)/\(post.postImages.count)")
                        .font(.caption)
                        .padding(6)
                        .background(Color.black.opacity(0.25))
                        .cornerRadius(10)
                        .padding(.trailing, 8)
                        .padding(.top, 8)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .offset(y: -120)
                }
            }
            //3) Dots at the bottom center
            if post.postImages.count > 1 {
                HStack(spacing: 6) {
                    ForEach(0..<post.postImages.count, id: \ .self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.blue : Color.gray.opacity(0.5))
                            .frame(width: 6, height: 6)
                    }
                }
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .bottom)
            }
           
            
            
            //3) action buttons row
            HStack(spacing: 10) {
                HStack(spacing: 4){
                    Button {
                        //action like
                    } label: {
                        Image(systemName: post.isLiked ? "suit.heart.fill" : "suit.heart")
                            .font(.system(size: 24))
                            .foregroundColor(post.isLiked ? .red : .black)
                    }
                    Text("\(post.likesCount)")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                
                //comment
                HStack(alignment: .center, spacing: 6){
                    Button {
                        //action of commenting
                    } label: {
                        Image("bubble_chat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                        
                    }
                    Text("\(post.commentCount)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .offset(y: -1)
                }
                
                //share/DM
                HStack(spacing: 5) {
                    Button {
                        //action
                    } label : {
                        Image(systemName: "paperplane")
                            .font(.system(size: 20))
                            .font(.system(size: 20))
                        
                    }
                    Text("\(post.shareCount)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .offset(y: -1)
                }
                
                Spacer()
                
                Button {
                    //save
                }
            label: {
                Image(systemName: "bookmark")
                    .font(.system(size: 24))
                
            }
                
            }
            //end hstack
            .padding(.horizontal, 8)
            .foregroundColor(Color(.darkGray))
            
            // 4) like info
            HStack(){
                Text("Liked by ")
                    .fontWeight(.regular)
                +
                Text(post.likedBy)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                +
                Text(" and ")
                    .fontWeight(.regular)
                +
                Text("others")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 8)
            .foregroundColor(Color(.darkGray))
            
            // 5) port caption
            HStack(alignment: .firstTextBaseline, spacing: 5){
                Text(post.username)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                +
                Text(" ")
                +
                Text(showTranslation ? "Auto-translated text: Lorem ipsum dolor ..." : post.caption)
                    .fontWeight(.regular)
            }
            .padding(.horizontal, 8)
            
            // 6_ Post date + see translation toggle
            HStack{
                Text(post.postDate)
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Button {
                    showTranslation.toggle()
                } label: {
                    Text(showTranslation ? "See original" : "See translation")
                        .font(.caption)
                        .foregroundColor(Color(.darkGray))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal, 8)
            .padding(.top, 2)
            
            
        }
    }
    
}

#Preview {
    PostCard(post: PostModel(id: 1, username: "june", userImage: "profile_self", postImages: ["post_3_b", "post_1"], likesCount: 7, likedBy: "vstra", shareCount: 2, caption: "city cold enough to see the melodies.", commentCount: 17, postDate: "July 25, 2024", subInfo: "Ho Chi Minh City",
                             isLiked: true,
                             isAuthentic: true))
}
