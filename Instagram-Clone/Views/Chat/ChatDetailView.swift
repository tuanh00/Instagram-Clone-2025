//
//  ChatDetailView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-05.
//

import SwiftUI

struct ChatDetailView: View {
    let groupChat: GroupChatModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            // 🔹 Header (Group Name + Back Button)
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }
                
                Spacer().frame(width: 25)
                
                    Image(groupChat.groupImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .clipped()
                        .clipShape(Circle())
                
                
                VStack(alignment: .leading) {
                    
                    
                    HStack {
                        Text(groupChat.groupName)
                            .font(.system(size: 20))
                            .bold()
                        
                        // ✅ Show chevron if NOT a channel
                        if !groupChat.isChannel {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                    if(groupChat.isChannel) {
                        HStack(spacing: 3) {
                            Text(groupChat.messages[0].senderUsername)
                            
                            Text("•")
                            
                            Text("\(groupChat.participants.count) members")
                        }
                        .foregroundColor(Color(.gray))
                        .font(.system(size: 13))
                        
                        
                    }
                }
                
                
                Spacer()
                
                if !groupChat.isChannel {
                    HStack(spacing: 15) {
                        Button(action: {}) {
                            Image(systemName: "phone")
                                .font(.system(size: 25))
                                .foregroundColor(.black.opacity(0.7))
                                .fontWeight(.semibold)
                        }
                        Button(action: {}) {
                            Image(systemName: "video")
                                .font(.system(size: 25))
                                .foregroundColor(.black.opacity(0.7))
                                .fontWeight(.semibold)
                        }
                    }
                } else {
                    Image(systemName: "bell")
                        .font(.system(size: 25))
                        .foregroundColor(.black.opacity(0.7))
                        .fontWeight(.semibold)
                }
                
                
            }
            .padding(.horizontal, 16)
            
            Divider()
                .foregroundColor(Color.gray.opacity(0.2))
            
            // 🔹 Chat Messages
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(groupChat.messages) { message in
                        messageBubble(for: message)
                    }
                }
                .padding()
            }
            
            // 🔹 Message Input Bar (Hidden for Channels)
            if !groupChat.isChannel {
                messageInputBar()
            } else {
                Text("Seen by \(groupChat.participants.count)")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity , alignment: .trailing)
                    .padding(.trailing, 15)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    // 🔹 Message Bubble UI
    @ViewBuilder
    private func messageBubble(for message: MessageModel) -> some View {
        HStack {
            if message.senderUsername == "You" {
                Spacer()
                messageContent(message)
            } else {
                HStack {
                    Image(message.senderImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    messageContent(message)
                    Spacer()
                }
            }
        }
        .padding(message.senderUsername == "You" ? .leading : .trailing, 10)
    }
    
    @ViewBuilder
    private func messageContent(_ message: MessageModel) -> some View {
        VStack(alignment: message.senderUsername == "You" ? .trailing : .leading) {
            if let replyTo = message.replyTo, !replyTo.isEmpty {
                Text("\(message.senderUsername) replied to you")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.bottom, 3)
                
                HStack {
                    if(message.senderUsername != "You") {
                        Rectangle()
                            .frame(width: 5, height: 45)
                            .foregroundColor(Color(.lightGray).opacity(0.3))
                            .cornerRadius(50)
                        
                        Spacer().frame(width: 15)
                    }
                    
                    Text(replyTo) // Original message
                        .padding(8)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .opacity(0.5)
                }
                
            }
            
            if message.isImage, !message.imageName.isEmpty {
                Image(message.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else if let content = message.content, !content.isEmpty {
                Text(content)
                    .padding(10)
                    .background(message.senderUsername == "You" ? Color.blue.opacity(0.8) : Color(.systemGray5))
                    .foregroundColor(message.senderUsername == "You" ? .white : .black)
                    .cornerRadius(10)
            } else {
                Text("⚠️ Missing content or image")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Text(message.timeSent)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    @ViewBuilder
    private func messageInputBar() -> some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "camera.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
            
            Text("Message...")
                .foregroundColor(.black.opacity(0.4))
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            //Icons
            HStack(spacing: 10) {
                Button(action: {}) {
                    Image(systemName: "microphone")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}) {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}) {
                    Image(systemName: "smiley.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                Button(action: {}) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        
                }
            }
            .foregroundColor(.black.opacity(0.8))
            
            Spacer().frame(width: 10)
        }
        .padding(.vertical, 6)
        .background(Color(UIColor.systemGroupedBackground))
        .cornerRadius(30)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChatDetailView(groupChat: GroupChatModel(
        id: 1,
        groupName: "Ohana",
        groupImage: "profile_1",
        participants: ["june", "itzpenut_pp", "harlee__"],
        latestMessage: "Hey, let’s catch up!",
        latestMessageSender: "david",
        latestMessageTime: "11h",
        isViewed: false,
        isMuted: false,
        isPinned: false,
        isChannel: false,
        isCloseFriend: false,
        messages: [
            MessageModel(id: 1, senderUsername: "You", senderImage: "profile_self", content: "Hey, how’s everyone?", timeSent: "10:30 AM", isSeen: true, isImage: false, imageName: "", replyTo: nil),
            MessageModel(id: 2, senderUsername: "david", senderImage: "profile_2", content: "We should plan something soon!", timeSent: "10:32 AM", isSeen: false, isImage: false, imageName: "", replyTo: "Hey, how’s everyone?"),
            MessageModel(id: 3, senderUsername: "anna", senderImage: "profile_3", content: nil, timeSent: "10:35 AM", isSeen: false, isImage: true, imageName: "post_2", replyTo: nil),
            MessageModel(id: 4, senderUsername: "june", senderImage: "profile_4", content: "That place looks amazing! 🌟", timeSent: "10:37 AM", isSeen: false, isImage: false, imageName: "", replyTo: nil),
            MessageModel(id: 5, senderUsername: "You", senderImage: "profile_self", content: "Let’s go this weekend!", timeSent: "10:40 AM", isSeen: false, isImage: false, imageName: "", replyTo: "That place looks amazing! 🌟"),
            MessageModel(id: 6, senderUsername: "harlee__", senderImage: "profile_5", content: "I found a nice spot near the beach 🌊", timeSent: "10:45 AM", isSeen: false, isImage: false, imageName: "", replyTo: "Let’s go this weekend!"),
            MessageModel(id: 7, senderUsername: "anna", senderImage: "profile_3", content: nil, timeSent: "10:50 AM", isSeen: false, isImage: true, imageName: "post_3_c", replyTo: nil),
            MessageModel(id: 8, senderUsername: "You", senderImage: "profile_self", content: "Excited!!", timeSent: "10:55 AM", isSeen: false, isImage: false, imageName: "", replyTo: "I found a nice spot near the beach 🌊"),
        ]
    ))
}
