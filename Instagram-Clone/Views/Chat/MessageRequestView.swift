//
//  MessageRequestsView.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-05.
//

import SwiftUI

struct MessageRequestView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            // 🔹 Header (Back Button + Title)
            HStack {
                Button(action: {
                    selectedTab = 0
                   dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.black)
                }

                Spacer()

                Text("Message Requests")
                    .font(.title2)
                    .bold()

                Spacer()
                
                Button(action: {
                    // Edit action
                }) {
                    Text("Edit")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            Divider()
            
            Spacer()
            
            VStack(spacing: 10) {
                Image(systemName: "message.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.gray)
                
                Text("No message requests")
                    .font(.title3)
                    .bold()
                
                Text("You don't have any message requests.")
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .navigationBarHidden(true) // Hide default navigation bar
    }
}

#Preview {
    MessageRequestView(selectedTab: .constant(0))
}
