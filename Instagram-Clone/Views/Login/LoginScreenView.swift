//
//  LoginScreenView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-06.
//

import SwiftUI

struct LoginScreenView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var username: String = "june"
    @State private var password: String = "••••••••••"
    @State private var navigateToMain = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                
                Spacer()
                //Instagram logo
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                
                Spacer().frame(height: 50)
                
                //Username Field
                VStack(alignment: .leading, spacing: 5) {
                    Text("Username, email or mobile number")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    
                    Text(username)
                        .fontWeight(.semibold)
                    
                }
                .padding(.leading, 15)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.lightGray), lineWidth: 1))
                
                //Password field
                VStack(spacing: 5) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Password")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .fontWeight(.medium)
                            
                            Text(password)
                                .fontWeight(.semibold)
                                .font(.system(size: 20))
                        }
                        Spacer()
                        
                        Image("closed_eyes_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 22, height: 22)
                            .padding(.trailing, 12)
                    }
                    
                    
                }
                .padding(.leading, 15)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.lightGray), lineWidth: 1))
                
                //Login Button
                Button(action: {
                    navigateToMain = true
                }) {
                    Text("Log in")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color("DarkBlue"))
                        .cornerRadius(50)
                }
                
                Button(action: {}) {
                    Text("Forgot password?")
                        .font(.system(size: 16))
                        .foregroundColor(Color(.darkGray))
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
                // 🔹 Meta Branding
                Text("ⓒ Meta")
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                
            }
            .padding(.horizontal, 10)
            .navigationDestination(isPresented: $navigateToMain) {
                MainTabBar()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginScreenView()
}
