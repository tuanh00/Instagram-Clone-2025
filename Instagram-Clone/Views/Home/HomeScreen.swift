import SwiftUI

struct HomeScreen: View {
    @State private var navigateToChatList = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // Top bar
                    HStack {
                        Image("instagram_text_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                        Spacer()
                        Image(systemName:("heart"))
                            .font(.system(size: 24))
                        
                        ZStack {
                            Button(action: {
                                navigateToChatList = true
                            }) {
                                Image("message_logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                            }
                            
                            //unread message count
                            Text("4")
                                .font(.caption2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 10, y: -10)
                    }
                    
                }
                .frame(height: 50)
                .padding(.horizontal, 16)
                    
                    NavigationLink (
                        destination: ChatListView(groupChats: sampleGroupChats)
                            .navigationBarBackButtonHidden(true),
                    isActive: $navigateToChatList
                    ) {
                        EmptyView()
                    }
                
                // End top bar
                
                StorySectionView()
                    .padding(.vertical, 8)
                
                PostSectionView()
            }
        }
        .navigationBarHidden(true)
    }
}
}

#Preview {
    HomeScreen()
}
