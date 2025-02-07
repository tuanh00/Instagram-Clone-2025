//
//  GroupChatCardView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-05.
//

import SwiftUI

struct GroupChatCardView: View {
    let groupChat: GroupChatModel  // ✅ No need for extra parameter

    var body: some View {
        HStack(spacing: 12) {
            // 🔹 Group Image with Ring Effect
            ZStack {
                ringView()
                    .frame(width: 58, height: 58) // 🔹 Match with StoryCard
                Image(groupChat.groupImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }

            VStack(alignment: .leading, spacing: 4) {
                // 🔹 Group Name + Pin Indicator
                HStack {
                    Text(groupChat.groupName)
                        .font(.headline)
                        .fontWeight(groupChat.isViewed ? .regular : .bold) // 🔹 Bold if unread
                        .lineLimit(1)
                    if groupChat.isPinned {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .clipped()
                            .foregroundColor(Color(.darkGray))
                    }
                }

                // 🔹 Latest Message Preview
                HStack {
                    Text("\(groupChat.latestMessageSender):")
                        .foregroundColor(groupChat.isViewed ? .gray : .black)
                        .fontWeight(groupChat.isViewed ? .regular : .bold)
                      

                    Text(groupChat.latestMessage)
                        .lineLimit(1)
                        .fontWeight(groupChat.isViewed ? .regular : .bold) // 🔹 Bold if unread
                        .foregroundColor(groupChat.isViewed ? .gray : .black)

                    Text(groupChat.latestMessageTime)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)

                    if groupChat.isMuted {
                        Image(systemName: "bell.slash.fill")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(.gray)
                    }
                }
                .font(.system(size: 16))
            }

            Spacer()

            // 🔹 Read Indicator or Camera Icon for Channels
            VStack {
                if groupChat.isChannel {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 8, height: 8)
                } else {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .clipped()
                        .fontWeight(groupChat.isViewed ? .regular : .semibold) 

                }
            }
        }
    }

    // 🔹 Ring View Based on StoryCard Logic
    @ViewBuilder
    private func ringView() -> some View {
        if groupChat.isCloseFriend {
            Circle()
                .stroke(Color.green, lineWidth: 3) // 🔹 Green ring
        } else if groupChat.isViewed {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 3) // 🔹 Gray ring (viewed)
        } else {
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [Color.red, Color.orange, Color.purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 3
                ) // 🔹 Instagram gradient for unread messages
        }
    }
}

#Preview {
    GroupChatCardView(
        groupChat: GroupChatModel(
            id: 1,
            groupName: "Design Group 🧚‍♀️",
            groupImage: "profile_3",
            participants: ["june", "panondawei", "di3young23"],
            latestMessage: "Let's review the design today.",
            latestMessageSender: "panondawei",
            latestMessageTime: "13h",
            isViewed: false,
            isMuted: true,
            isPinned: true,
            isChannel: false,
            isCloseFriend: true, 
            messages: []
        )
    )
}
