//
//  LoginSelectionView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-06.
//

import SwiftUI

struct LoginSelectionView: View {
    @State private var navigateToLogin = false
    @State private var navigateToMain = false
    
    var body: some View {
        NavigationStack {
            VStack {
                // 🔹 Ellipsis Button (Top Right)
                HStack {
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                    }
                    .padding(.trailing, 15)
                }
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    // 🔹 Instagram Logo
                    Image("instagram_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                    
                    Spacer().frame(height: 16)
                    
                    // 🔹 Profile Image
                    Image("profile_self")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(4)
                        .overlay(Circle().stroke(Color(.lightGray), lineWidth: 0.2))
                    
                    // 🔹 Username
                    VStack(spacing: 2) {
                        Text("june")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.black)
                        
                        // 🔹 New Notification
                        HStack(spacing: 3) {
                            Text("•")
                                .font(.system(size: 25))
                                .foregroundColor(.red)
                                .offset(y: -1)
                            
                            Text("New notifications")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // 🔹 Log In Button
                    NavigationLink(destination: MainTabBar()
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)) {
                            Text("Log in")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                                .background(Color("DarkBlue"))
                                .cornerRadius(50)
                        }
                        .padding(.horizontal, 10)
                    
                    // 🔹 Log into Another Account Button
                    NavigationLink(destination: LoginScreenView()) {
                        Text("Log into another account")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                    }
                    
                    Spacer()
                    
                    // 🔹 Create New Account
                    Button(action: {}) {
                        Text("Create new account")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("DarkBlue"))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color("DarkBlue"), lineWidth: 1))
                    }
                    .padding(.horizontal, 10)
                    
                    // 🔹 Meta Branding
                    Text("ⓒ Meta")
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                    
                }
                .background(Color(.systemBackground))
            }
            .padding(.horizontal, 8)
        }
    }
}

#Preview {
    LoginSelectionView()
}
