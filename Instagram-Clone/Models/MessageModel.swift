//
//  MessageModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-04.
//

import Foundation

struct MessageModel: Identifiable {
    let id: Int
    let senderUsername: String
    let senderImage: String
    let content: String?
    let timeSent: String
    let isSeen: Bool
    let isImage: Bool
    let imageName: String
    let replyTo: String?
}
