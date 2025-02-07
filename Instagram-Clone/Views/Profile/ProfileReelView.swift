//
//  ProfileReelView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-03.
//

import SwiftUI
import AVFoundation

struct ProfileReelView: View {
    let reels: [ReelModel] // ✅ Using ReelModel instead of PostModel
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(reels) { reel in
                    ZStack(alignment: .bottomLeading) { // ✅ Align watch count at bottom left
                        VideoThumbnailView(videoName: reel.videoName) // ✅ Get video thumbnail
                            .frame(width: UIScreen.main.bounds.width / 3, height: (UIScreen.main.bounds.width / 2.5) * 1.2)
                            .clipped()
                        
                        // Watch count
                        HStack(spacing: 4) {
                            Image(systemName: "eye.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.white)
                            
                            Text("\(reel.watchCount)")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(4)
                    }
                }
            }
        }
    }
}

// **Generate Thumbnail from Video**
struct VideoThumbnailView: View {
    let videoName: String
    
    @State private var thumbnail: UIImage? = nil
    
    var body: some View {
        Group {
            if let thumbnail = thumbnail {
                Image(uiImage: thumbnail)
                    .resizable()
                    .scaledToFill()
            } else {
                Color.black.opacity(0.3) // Placeholder while loading
                    .overlay(
                        ProgressView() // Show a loading spinner
                    )
            }
        }
        .onAppear {
            generateThumbnail(for: videoName)
        }
    }
    
    // Generate Thumbnail
    func generateThumbnail(for videoName: String) {
        DispatchQueue.global(qos: .background).async {
            if let image = getThumbnailFrom(videoName: videoName) {
                DispatchQueue.main.async {
                    self.thumbnail = image
                }
            }
        }
    }
    
    func getThumbnailFrom(videoName: String) -> UIImage? {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else {
            print("⚠️ Video not found: \(videoName)")
            return nil
        }
        
        let asset = AVAsset(url: url)
        let assetImageGenerator = AVAssetImageGenerator(asset: asset)
        assetImageGenerator.appliesPreferredTrackTransform = true
        let time = CMTime(seconds: 1, preferredTimescale: 60)
        
        do {
            let cgImage = try assetImageGenerator.copyCGImage(at: time, actualTime: nil)
            return UIImage(cgImage: cgImage)
        } catch {
            print("❌ Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
}

// ✅ **Fixed Preview**
#Preview {
    ProfileReelView(reels: [
        ReelModel(id: 1, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_1", likeCount: 300, commentCount: 20, shareCount: 20, watchCount: 110, isFollowing: true, audioTitle: "Trending sound", description: "Having fun!", isLiked: false),
        ReelModel(id: 2, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_2", likeCount: 400, commentCount: 50, shareCount: 30, watchCount: 500, isFollowing: false, audioTitle: "Viral Sound", description: "Just vibing!", isLiked: true),
        ReelModel(id: 3, username: "june", userImage: "profile_self", topProfiles: ["user1", "user2"], videoName: "video_3", likeCount: 400, commentCount: 50, shareCount: 30, watchCount: 450, isFollowing: false, audioTitle: "Viral Sound", description: "Just vibing!", isLiked: true)
    ])
}
