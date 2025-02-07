import SwiftUI

struct ReelSectionView: View {
    let reels: [ReelModel] = [
        ReelModel(id: 1, username: "itzpenut_p", userImage: "profile_1",
                  topProfiles: ["profile_2", "profile_3", "profile_4"],
                  videoName: "video_1", likeCount: 120, commentCount: 45,
                  shareCount: 10, watchCount: 20, isFollowing: false,
                  audioTitle: "Ecco2k · AAA Powerline", description: "I8 night shopping 🛍️",
                  isLiked: true),
        
        ReelModel(id: 2, username: "harlee__", userImage: "profile_2",
                  topProfiles: ["profile_5", "profile_6", "profile_1"],
                  videoName: "video_2", likeCount: 512, commentCount: 80,
                  shareCount: 12, watchCount: 33, isFollowing: true,
                  audioTitle: "toyoufromrussie · Original audio", description: "put this on and cruise 🚗",
                  isLiked: false),
        
        ReelModel(id: 3, username: "di3young23", userImage: "profile_3",
                  topProfiles: ["profile_2", "profile_3", "profile_self"],
                  videoName: "video_3", likeCount: 20, commentCount: 10,
                  shareCount: 5, watchCount: 45, isFollowing: true,
                  audioTitle: "amyrosemedia · Original audio", description: "Without you, my 2023 would have been bad 💗",
                  isLiked: true)
    ]
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // 🔹 **Full-Screen Vertical Swiping using ScrollView**
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) { // ✅ Ensures reels are stacked with no gaps
                    ForEach(reels.indices, id: \.self) { index in
                        ReelCard(reel: reels[index])
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                            .clipped()
                    }
                }
            }
            .ignoresSafeArea()
            .scrollDisabled(false) // ✅ Enables smooth vertical scrolling
            
            // 🔹 Floating "Reels" Title at Top Left
            HStack {
                Button {
                    // Action if needed
                } label: {
                    HStack(spacing: 4) {
                        Text("Reels")
                            .fontWeight(.heavy)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title3)
                            .scaleEffect(0.6)
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.top, 60) // ✅ Adjusted for dynamic island notch
        }
    }
}

#Preview {
    ReelSectionView()
}
