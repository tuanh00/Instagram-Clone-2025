//
//  ChatListView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-05.
//

import SwiftUI

let sampleGroupChats: [GroupChatModel] = [
    // 🏝️ Ohana Group - Travel Discussions
    GroupChatModel(id: 1, groupName: "Ohana", groupImage: "group_1", participants: ["june", "anna 🧚‍♀️", "bunny 🐰", "david"], latestMessage: "Let's meet up!", latestMessageSender: "anna", latestMessageTime: "10m", isViewed: false, isMuted: false, isPinned: true, isChannel: false, isCloseFriend: true, messages: [
        MessageModel(id: 1, senderUsername: "You", senderImage: "profile_self", content: "Hey, how’s everyone?", timeSent: "10:30 AM", isSeen: true, isImage: false, imageName: "", replyTo: nil),
        MessageModel(id: 2, senderUsername: "david", senderImage: "profile_2", content: "We should plan something soon!", timeSent: "10:32 AM", isSeen: false, isImage: false, imageName: "", replyTo: "Hey, how’s everyone?"),
        MessageModel(id: 3, senderUsername: "anna 🧚‍♀️", senderImage: "profile_3", content: nil, timeSent: "10:35 AM", isSeen: false, isImage: true, imageName: "minion", replyTo: nil),
        MessageModel(id: 4, senderUsername: "bunny 🐰", senderImage: "profile_4", content: "Haha 🤣", timeSent: "10:37 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
    ]),

    // 🍔 Foodies United - Food Discussions
    GroupChatModel(id: 2, groupName: "Foodies United", groupImage: "group_3", participants: ["alex", "bella", "sam"], latestMessage: "Just tried a new burger!", latestMessageSender: "alex", latestMessageTime: "1h", isViewed: true, isMuted: false, isPinned: true, isChannel: false, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "alex", senderImage: "profile_5", content: nil, timeSent: "09:30 AM", isSeen: true, isImage: true, imageName: "burger", replyTo: nil),
        MessageModel(id: 2, senderUsername: "bella", senderImage: "profile_6", content: "That looks delicious 🤤", timeSent: "09:35 AM", isSeen: true, isImage: false, imageName: "", replyTo: nil),
        MessageModel(id: 3, senderUsername: "sam", senderImage: "profile_7", content: "😋", timeSent: "09:40 AM", isSeen: true, isImage: false, imageName: "", replyTo: nil),
    ]),

    // 🏋️ Fitness Freaks - Workout Discussions
    GroupChatModel(id: 3, groupName: "Fitness Freaks", groupImage: "group_3", participants: ["mike", "sophie", "jess"], latestMessage: "Leg day today!", latestMessageSender: "mike", latestMessageTime: "3h", isViewed: true, isMuted: false, isPinned: false, isChannel: false, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "sophie", senderImage: "profile_9", content: "Check out my progress! 💪", timeSent: "07:00 AM", isSeen: true, isImage: true, imageName: "workout", replyTo: nil),
        MessageModel(id: 2, senderUsername: "jess", senderImage: "profile_10", content: "Keep it up!", timeSent: "07:10 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
    ]),

    // 🎮 Gaming Community - Game Talk
    GroupChatModel(id: 4, groupName: "Gaming Community", groupImage: "group_4", participants: ["lucas", "nina", "chris"], latestMessage: "New update in Valorant!", latestMessageSender: "lucas", latestMessageTime: "5h", isViewed: false, isMuted: true, isPinned: false, isChannel: false, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "lucas", senderImage: "profile_7", content: "Who's up for a match?", timeSent: "06:00 AM", isSeen: false, isImage: false, imageName: "thumb_up", replyTo: nil),
        MessageModel(id: 2, senderUsername: "nina", senderImage: "profile_8", content: nil, timeSent: "06:10 AM", isSeen: true, isImage: true, imageName: "game_screenshot", replyTo: nil),
    ]),

    // 🚀 Tech Talk - Latest Tech News (Channel)
    GroupChatModel(id: 5, groupName: "Tech Talk", groupImage: "group_5", participants: ["tech_guru"], latestMessage: "Apple's new Vision Pro is out!", latestMessageSender: "tech_guru", latestMessageTime: "1h", isViewed: true, isMuted: false, isPinned: false, isChannel: true, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "tech_guru", senderImage: "profile_8", content: "Check out the specs of Vision Pro! 🔥", timeSent: "1h", isSeen: false, isImage: false, imageName: "", replyTo: nil)
    ]),

    // ⚽ Sports Zone - A Channel
    GroupChatModel(id: 6, groupName: "Sports Zone", groupImage: "group_3", participants: ["sports_fanatic"], latestMessage: "Who will win the UEFA finals?", latestMessageSender: "sports_fanatic", latestMessageTime: "2h", isViewed: true, isMuted: false, isPinned: false, isChannel: true, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "sports_fanatic", senderImage: "profile_5", content: "Real Madrid or Man City? ⚽", timeSent: "2h", isSeen: true, isImage: false, imageName: "", replyTo: nil)
    ]),

    // 📚 Book Lovers - Literature
    GroupChatModel(id: 7, groupName: "Book Lovers", groupImage: "profile_10", participants: ["mia", "tom", "lucy 🐳"], latestMessage: "Discussing the latest novel!", latestMessageSender: "mia", latestMessageTime: "4h", isViewed: false, isMuted: false, isPinned: false, isChannel: false, isCloseFriend: true, messages: [
        MessageModel(id: 1, senderUsername: "tom", senderImage: "profile_9", content: "Chapter 3 had a huge plot twist!", timeSent: "02:30 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
        MessageModel(id: 2, senderUsername: "You", senderImage: "profile_self", content: "Will check it 🤩", timeSent: "02:35 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
        MessageModel(id: 3, senderUsername: "lucy 🐳", senderImage: "profile_5", content: "🙊", timeSent: "03:35 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
    ]),

    // 🎨 Art & Creativity
    GroupChatModel(id: 8, groupName: "Art & Creativity", groupImage: "group_1", participants: ["eva", "leo 🌟", "sarah"], latestMessage: "New painting completed!", latestMessageSender: "eva", latestMessageTime: "5h", isViewed: true, isMuted: true, isPinned: false, isChannel: false, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "leo 🌟", senderImage: "profile_6", content: nil, timeSent: "06:30 AM", isSeen: false, isImage: true, imageName: "artwork_painting", replyTo: nil),
        MessageModel(id: 2, senderUsername: "You", senderImage: "profile_self", content: "Nice work 💗", timeSent: "06:35 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
    ]),

    // 🛠️ DIY & Home Improvement
    GroupChatModel(id: 9, groupName: "DIY & Home Improvement", groupImage: "group_3", participants: ["dan", "amy", "carl"], latestMessage: "Built a new bookshelf!", latestMessageSender: "dan", latestMessageTime: "6h", isViewed: false, isMuted: false, isPinned: false, isChannel: false, isCloseFriend: false, messages: [
        MessageModel(id: 1, senderUsername: "amy", senderImage: "profile_7", content: "That looks sturdy! 💪", timeSent: "06:30 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
    ])
]


struct ChatListView: View {
    @State private var selectedTab: Int = 0
    @State private var navigateToRequests = false
    @Environment(\.dismiss) private var dismiss

    let groupChats: [GroupChatModel]

    var filteredChats: [GroupChatModel] {
        switch selectedTab {
        case 0: return groupChats
        case 1: return groupChats.filter { $0.isChannel }
        default: return []
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                // 🔹 Username & Toolbar
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.black)
                    }
                    
                    Spacer().frame(width: 10)
                    
                    Text("june")
                        .font(.system(size: 30))
                        .fontWeight(.semibold)

                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.black)

                    Spacer()

                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .clipped()
                }
                .padding(.horizontal, 16)
                .padding(.top, 10)

                // 🔹 Tab Selection
                HStack {
                    Spacer()
                    tabButton(title: "Messages", index: 0)
                    Spacer()
                    tabButton(title: "Channels", index: 1)
                    Spacer()
                    tabButton(title: "Requests", index: 2)
                    Spacer()
                }
                .padding(.vertical, 6)

                // 🔹 Content Based on Selected Tab
                if selectedTab == 2 {
                    NavigationLink("", destination: MessageRequestView(selectedTab: $selectedTab), isActive: $navigateToRequests)
                        .hidden()
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(filteredChats) { chat in
                                NavigationLink(destination: ChatDetailView(groupChat: chat)) {
                                    GroupChatCardView(groupChat: chat)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 16)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .onChange(of: selectedTab) { newValue in
            if newValue == 2 {
                navigateToRequests = true
            }
        }
    }

    private func tabButton(title: String, index: Int) -> some View {
        Button(action: { selectedTab = index }) {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(selectedTab == index ? Color.blue : Color(.darkGray))
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(selectedTab == index ? Color.blue.opacity(0.2) : Color(.lightGray).opacity(0.2))
                .cornerRadius(10)
        }
    }
}

#Preview {
    ChatListView(groupChats: sampleGroupChats)
}
