//
//  SettingsView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-06.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var navigateToLoginSelection = false

    var body: some View {
        NavigationStack {
            VStack {
                // 🔹 Top Bar
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("Settings and activity")
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                .frame(height: 50)

                Divider()
                //Search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    Text("Search")
                        .foregroundColor(Color(.darkGray))
                    
                    Spacer() // Pushes text to the left
                }
                .padding(.horizontal, 20)
                .frame(height: 40) // Set fixed height
                .frame(width: UIScreen.main.bounds.width - 15)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10) // Rounded corners
                .padding(.bottom, 15)
                // 🔹 Settings List
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // **YOUR ACCOUNT SECTION**
                        Section(header: Text("Your Account").font(.headline)) {
                            HStack(spacing: 10) {
                                Image(systemName: "person.crop.circle")
                                    .foregroundColor(.black)
                                    .frame(width: 24)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("Accounts Center")
                                        .font(.system(size: 16))
                                    Text("Password, security, personal details, ad preferences")
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        VStack {
                            Text("Manage your connected experiences and account settings across Meta technologies.")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                            +
                            Text(" ")
                            +
                            Text(" Learn more")
                                .foregroundColor(.blue)
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                        }
                        .padding(.vertical, 10)
                        
                            
                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))

                        // **HOW YOU USE INSTAGRAM**
                        Section(header: Text("How you use Instagram").font(.headline)) {
                            SettingCard(icon: "bookmark", title: "Saved", subtitle: nil)
                            SettingCard(icon: "clock.arrow.circlepath", title: "Archive", subtitle: nil)
                            SettingCard(icon: "bell", title: "Notifications", subtitle: nil)
                            SettingCard(icon: "clock", title: "Time management", subtitle: nil)
                        }
                        
                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **WHO CAN SEE YOUR CONTENT**
                        Section(header: Text("Who can see your content").font(.headline)) {
                            SettingCard(icon: "lock", title: "Account Privacy", subtitle: "Private")
                            SettingCard(icon: "star", title: "Close Friends", subtitle: "9")
                            SettingCard(icon: "square.grid.2x2", title: "Crossposting", subtitle: nil)
                        }

                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **HOW OTHERS CAN INTERACT WITH YOU**
                        Section(header: Text("How others can interact with you").font(.headline)) {
                            SettingCard(icon: "bubble.left.and.bubble.right", title: "Messages and Story Replies", subtitle: nil)
                            SettingCard(icon: "at", title: "Tags and Mentions", subtitle: nil)
                            SettingCard(icon: "quote.bubble", title: "Comments", subtitle: nil)
                            SettingCard(icon: "arrowshape.turn.up.right", title: "Sharing", subtitle: nil)
                            SettingCard(icon: "hand.raised", title: "Restricted", subtitle: "0")
                            SettingCard(icon: "exclamationmark.triangle", title: "Limit Interactions", subtitle: nil)
                            SettingCard(icon: "textformat.abc", title: "Hidden Words", subtitle: nil)
                        }

                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **WHAT YOU SEE**
                        Section(header: Text("What you see").font(.headline)) {
                            SettingCard(icon: "star", title: "Favorites", subtitle: "0")
                            SettingCard(icon: "eye.slash", title: "Muted Accounts", subtitle: "9")
                            SettingCard(icon: "gear", title: "Content Preferences", subtitle: nil)
                            SettingCard(icon: "hand.thumbsup", title: "Like and Share Counts", subtitle: nil)
                        }

                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **YOUR APP AND MEDIA**
                        Section(header: Text("Your app and media").font(.headline)) {
                            SettingCard(icon: "lock.shield", title: "Device Permissions", subtitle: nil)
                            SettingCard(icon: "arrow.down.doc", title: "Archiving and Downloading", subtitle: nil)
                            SettingCard(icon: "figure.wave", title: "Accessibility and Translations", subtitle: nil)
                            SettingCard(icon: "globe", title: "Language", subtitle: nil)
                            SettingCard(icon: "antenna.radiowaves.left.and.right", title: "Media Quality", subtitle: nil)
                            SettingCard(icon: "network", title: "App Website Permissions", subtitle: nil)
                        }

                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // ** FOR FAMILIES**
                        Section(header: Text("For families").font(.headline)) {
                            SettingCard(icon: "figure.2.and.child.holdinghands", title: "Family Center", subtitle: nil)
                            SettingCard(icon: "checkmark.seal", title: "Meta Verified", subtitle: "Not subscribed")
                        }
                        
                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **FOR PROFESSIONALS**
                        Section(header: Text("For professionals").font(.headline)) {
                            SettingCard(icon: "chart.bar", title: "Account Type and Tools", subtitle: nil)
                            SettingCard(icon: "checkmark.seal", title: "Meta Verified", subtitle: "Not subscribed")
                        }

                        
                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        //**YOUR ORDERS AND FUNDRAISERS
                        Section(header: Text("Your orders and fundraisers").font(.headline)) {
                            SettingCard(icon: "bolt.heart", title: "Fundraisers", subtitle: nil)
                            SettingCard(icon: "shippingbox", title: "Orders and payments", subtitle: nil)
                        }
                        
                        Divider()
                               .frame(height: 6)
                               .background(Color(.lightGray).opacity(0.1))
                        
                        // **MORE INFO AND SUPPORT**
                        Section(header: Text("More info and support").font(.headline)) {
                            SettingCard(icon: "questionmark.circle", title: "Help", subtitle: nil)
                            SettingCard(icon: "shield", title: "Privacy Center", subtitle: nil)
                            SettingCard(icon: "person", title: "Account Status", subtitle: nil)
                            SettingCard(icon: "info.circle", title: "About", subtitle: nil)
                        }

                        
                    Divider()
                           .frame(height: 6)
                           .background(Color(.lightGray).opacity(0.1))
                        
                        // **ALSO FROM META**
                        Section(header: Text("Also from Meta").font(.headline)) {
                            SettingCard(icon: "message", title: "WhatsApp", subtitle: nil)
                            SettingCard(icon: "at", title: "Threads", subtitle: nil)
                            SettingCard(icon: "f.circle", title: "Facebook", subtitle: nil)
                            SettingCard(icon: "app.gift", title: "Meta Quest", subtitle: nil)
                        }
                        
                        
                    Divider()
                           .frame(height: 6)
                           .background(Color(.lightGray).opacity(0.1))
                        
                        Section(header: Text("Login").font(.headline)) {
                            //Add account
                            Button(action: {}) {
                                Text("Add account")
                                    .font(.system(size: 16))
                                    .foregroundColor(.blue)
                                    .frame(height: 35)
                            }
                            // 🔹 Log out Button
                            Button(action: {
                                navigateToLoginSelection = true
                            }) {
                                Text("Log out")
                                    .font(.system(size: 16))
                                    .foregroundColor(.red)
                                    
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

               
                NavigationLink(destination: LoginSelectionView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true), isActive: $navigateToLoginSelection) {
                        EmptyView()
                }
            }
            .background(Color(.systemBackground))
        }
    }
}

#Preview {
    SettingsView()
}
