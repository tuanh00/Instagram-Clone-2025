//
//  StoryCard.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import SwiftUI

struct StoryCard: View {
    
    let story: StoryModel
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                ringView()
                    .frame(width: 70, height: 70)
                Image(story.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            Text(story.username)
                .fontWeight(.light)
                .font(.system(size: 12))
            
        }
    }
    
    @ViewBuilder
    private func ringView() -> some View {
        if story.isCloseFriend {
            //green ring
            Circle()
                .stroke(Color.green, lineWidth: 3)
        } else if story.isViewed {
            // gray ring
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 3)
        } else {
            //Insta gradient
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color.red, Color.orange, Color.purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 3
                )
        }
    }
}

#Preview {
    StoryCard(story: StoryModel(id: 1, username: "tuanh", image: "profile_self", isViewed: false, isCloseFriend: false, date: "October 21, 2024"))
}
