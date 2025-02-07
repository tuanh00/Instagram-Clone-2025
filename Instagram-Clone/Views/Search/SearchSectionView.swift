import SwiftUI

struct SearchSectionView: View {
    
    let images: [String] = ["profile_self", "profile_1", "profile_2", "profile_3",
                            "profile_4", "profile_5", "profile_6"]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack{
                    Spacer().frame(width: 10)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    Text("Ask Meta AI or Search")
                        .font(.system(size: 16))
                        .padding(.leading, 5)
                        .padding(.vertical, 10)
                        .foregroundColor(Color(.darkGray))
                    Spacer().frame(width: 150)
                }
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.1))
                )
                .padding(.bottom, 6)
                .padding(.horizontal, 16)
                
            }
            VStack(spacing: 2) { // 🔹 Main container
                
                ForEach(0..<2, id: \.self) { _ in // 🔹 Repeat layout twice to create 4 big rows
                    
                    // 🔹 First Big Row
                    HStack(spacing: 2) {
                        // 🔹 2x2 Grid on Left
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 2), spacing: 2) {
                            ForEach(0..<4, id: \.self) { index in
                                ZStack(alignment: .topTrailing) {
                                    Image(images[index % images.count])
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width / 3,
                                               height: UIScreen.main.bounds.width / 3)
                                        .clipped()
                                        .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, lineWidth: 1))
                                    
                                    if index % 2 == 0 {
                                        Image(systemName: "play.square.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 32)
                                            .padding(.vertical, 12)
                                    }
                                }
                            }
                        }
                        
                        // 🔹 Tall (2x1) Rect on Right (No Change)
                        ZStack(alignment: .topTrailing) { // 🔹 Stacks the main image & logo
                            Image(images[4 % images.count])
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width / 1.8,
                                       height: (UIScreen.main.bounds.width / 3) * 2 + 2)
                                .clipped()
                                .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, lineWidth: 1))
                            
                            // 🔹 Add Logo Image (Top-Right)
                            Image(systemName: "square.fill.on.square.fill") // Replace "logo" with your actual logo asset name
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26) // Adjust logo size
                                .padding(16) // Adds space from the edges
                                .foregroundColor(.white)
                        }
                        
                    }
                    .offset(x: -14)
                    
                    // 🔹 Second Big Row (📌 Slightly Widened Standing Rectangle)
                    HStack(spacing: 2) {
                        // 🔹 Tall (2x1) Rect on Left (📌 Slightly Widened)
                        Image(images[5 % images.count])
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 2,
                                   height: (UIScreen.main.bounds.width / 3) * 2 + 2)
                            .clipped()
                            .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, lineWidth: 1))
                        
                        // 🔹 2x2 Grid on Right
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 2), count: 2), spacing: 2) {
                            ForEach(6..<10, id: \.self) { index in
                                Image(images[index % images.count])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width / 3,
                                           height: UIScreen.main.bounds.width / 3)
                                    .clipped()
                                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(Color.white, lineWidth: 1))
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity) // ✅ Forces full width coverage
        }
        .background(Color.white.edgesIgnoringSafeArea(.all)) // ✅ Black background fills entire screen
    }
}

#Preview {
    SearchSectionView()
}
