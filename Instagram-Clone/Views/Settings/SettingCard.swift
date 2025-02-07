//
//  SettingCard.swift
//  Instagram-Clone
//
//  Created by LaSalle on 2025-02-06.
//

import SwiftUI

struct SettingCard: View {
    let icon: String
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
                .frame(width: 24)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16))

               
            }
            Spacer()
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 10)
    }
}


#Preview {
    SettingCard(icon: "lock", title: "Account privacy", subtitle: "Privacy")
}
