import SwiftUI
import AVKit

struct ReelCard: View {
    let reel: ReelModel
    
    @State private var player: AVPlayer?
    @State private var animate = false  // ✅ Added missing state for animation
    
    var body: some View {
        ZStack {
            
            // MARK: Video background
            if let player = player {
                VideoPlayer(player: player)
                    .onAppear {
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
            } else {
                Color.black
                    .overlay {
                        ProgressView("Loading video…")
                            .foregroundColor(.white)
                    }
            }
            
            // MARK: Overlays
            VStack {
                // 1) TOP RIGHT: the circles from reel.topProfiles
                HStack {
                    Spacer()
                    HStack(spacing: 8) {
                        ForEach(reel.topProfiles, id: \.self) { profileImg in
                            ZStack(alignment: .topTrailing) {
                                Image(profileImg)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(.pink)
                                    .offset(x: 2, y: -2)
                            }
                        }
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 8)
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(10)
                    .padding(.trailing, 8)
                    .padding(.top, 50)  // push down from the top
                }
                
                Spacer()
                
                // 2) BOTTOM Overlays
                HStack(alignment: .bottom, spacing: 20) {
                    
                    // Left side: user & desc
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(reel.userImage)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(reel.username)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                // Marquee Effect for Audio Title
                                GeometryReader { geometry in
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            Text(reel.audioTitle)
                                                .font(.caption)
                                                .foregroundColor(.white)
                                                .offset(x: animate ? -geometry.size.width : 0)
                                                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: animate)
                                        }
                                    }
                                }
                                .frame(width: 100, height: 20) 
                            }
                        }
                        .onAppear {
                            animate = true
                        }
                        
                        Text(reel.description)
                            .foregroundColor(.white)
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    // Right side: icons
                    VStack(spacing: 20) {
                        // Like
                        Button {
                            // ...
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: reel.isLiked ? "heart.fill" : "heart" )
                                    .foregroundColor(reel.isLiked ? .red : .white)
                                    .font(.title)
                                Text("\(reel.likeCount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                            }
                        }
                        
                        // Comment
                        Button {
                            // ...
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: "bubble.right")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.white)
                                Text("\(reel.commentCount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                            }
                        }
                        
                        // Share
                        Button {
                            // ...
                        } label: {
                            VStack(spacing: 6) {
                                Image(systemName: "paperplane")
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(.white)
                                Text("\(reel.shareCount)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                            }
                        }
                        
                        // More
                        Button {
                            // ...
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(.white)
                        }
                        
                        // Audio (Square Image)
                        Image(reel.userImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 170)
                .padding(.trailing, 10)
            }
            
            // 3) Thin black line at bottom to seperate each reel card
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 1)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            loadVideo()
        }
    }
    
    private func loadVideo() {
        if let fileURL = Bundle.main.url(forResource: reel.videoName, withExtension: "mp4") {
            player = AVPlayer(url: fileURL)
        } else {
            print("⚠️ Could not find \(reel.videoName).mp4")
        }
    }
}

#Preview {
    ReelCard(
        reel: ReelModel(
            id: 1,
            username: "june",
            userImage: "profile_self",
            topProfiles: ["profile_1", "profile_2", "profile_3"], // Example
            videoName: "video_1",
            likeCount: 123,
            commentCount: 30,
            shareCount: 10,
            watchCount: 20,
            isFollowing: false,
            audioTitle: "🎵 catsdoingthings",
            description: "moments I can't capture",
            isLiked: true
        )
    )
}
