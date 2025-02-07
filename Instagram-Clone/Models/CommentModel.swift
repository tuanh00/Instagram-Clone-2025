//
//  CommentModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct CommentModel {
    let id: Int
    let username: String
    let text: String
    let likes: Int
    let replies: [ReplyModel]
}
