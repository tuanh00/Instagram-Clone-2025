//
//  StoryModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct StoryModel: Identifiable {
    let id: Int
    let username: String
    let image: String
    let isViewed: Bool
    let isCloseFriend: Bool
    let date: String
}
