//
//  MainTabBar.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-01.
//

import SwiftUI

struct MainTabBar: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            // **Tab Content**
            TabView(selection: $selectedTab) {
                
                // 1) Home
                HomeScreen()
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .renderingMode(.template)
                    }
                    .tag(0)
                
                // 2) Search
                SearchSectionView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                            .renderingMode(.template)
                    }
                    .tag(1)
                
                // 3) Create Post
                Text("Create Post")
                    .tabItem {
                        Image(systemName: "plus.square")
                            .renderingMode(.template)
                    }
                    .tag(2)
                
                // 4) Reels
                ReelSectionView()
                    .tabItem {
                        Image(systemName: selectedTab == 3 ? "play.square.fill" : "play.square")
                            .renderingMode(.template)
                    }
                    .tag(3)
                
                // 5) Profile
                ProfileScreen()
                    .tabItem {
                        Image(systemName: selectedTab == 4 ? "person.crop.circle.fill" : "person.crop.circle")
                            .renderingMode(.template)
                    }
                    .tag(4)
            }
            .accentColor(.black) // Changes the selected icon color to black
            .background(Color.white)
            
        }
        .edgesIgnoringSafeArea(.bottom) // Ensures the tab bar sticks to the bottom
        .background(Color.white) // Ensures background is white
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

#Preview {
    MainTabBar()
}
