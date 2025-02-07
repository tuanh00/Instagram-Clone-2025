//
//  HighlightModel.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import Foundation

struct HighlightModel: Identifiable {
    let id: Int
    let title: String
    let coverImage: String
    let stories: [StoryModel]
}
