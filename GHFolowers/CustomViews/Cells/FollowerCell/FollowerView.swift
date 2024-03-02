//
//  FollowerView.swift
//  GHFolowers
//
//  Created by Marek Srutka on 02.03.2024.
//

import SwiftUI

struct FollowerView: View {
    
    var follower: Follower
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(.avatarPlaceholder)
                    .resizable()
                    .scaledToFit()
            }
            .clipShape(.circle)
            
            Text(follower.login)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.6)
        }
    }
}

#Preview {
    FollowerView(follower: Follower(login: "MarekSrutka", avatarUrl: ""))
}
