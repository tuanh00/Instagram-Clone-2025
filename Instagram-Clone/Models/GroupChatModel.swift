//
//  GroupChatModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-04.
//

import Foundation

struct GroupChatModel: Identifiable {
    let id: Int
    let groupName: String
    let groupImage: String
    let participants: [String]
    let latestMessage: String
    let latestMessageSender: String
    let latestMessageTime: String
    let isViewed: Bool
    let isMuted: Bool
    let isPinned: Bool
    let isChannel: Bool
    let isCloseFriend: Bool
    let messages: [MessageModel]
}
