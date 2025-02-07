//
//  StorySectionView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import SwiftUI

struct StorySectionView: View {
    //sample data
    let stories: [StoryModel] = [
        StoryModel(id: 1, username: "You", image: "profile_self", isViewed: false, isCloseFriend: true, date: "September 1, 2024"),
        StoryModel(id: 2, username: "alex",  image: "profile_2",    isViewed: false,  isCloseFriend: true, date: "October 5, 2024"),
        StoryModel(id: 3, username: "lisa",  image: "profile_3",    isViewed: false, isCloseFriend: false, date: "November 22, 2024"),
        StoryModel(id: 4, username: "mike",  image: "profile_4",    isViewed: false,  isCloseFriend: false, date: "December 24, 2024"),
        StoryModel(id: 5, username: "helen", image: "profile_5",    isViewed: true, isCloseFriend: false, date: "December 26, 2024"),
        StoryModel(id: 6, username: "vstra", image: "profile_6",    isViewed: true, isCloseFriend: false, date: "December 26, 2024")
    ]
    
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 12){
                ForEach(stories, id: \.id) {
                    story in StoryCard(story: story)
                        .shadow(color: .gray.opacity(0.2), radius: 5, x: 5, y: 5)
                }
            }
            .padding(.leading, 16)
           
        }
    }
}

#Preview {
    StorySectionView()
}
