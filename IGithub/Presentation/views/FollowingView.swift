//
//  FollowingView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct FollowingView: View {
    var body: some View {
        VStack(alignment:.leading){
            IGithubText(text:"Felix Kariuki",
                        fontFamily:Fonts.nunitoBold,
                        fontSize: 16)
        }
    }
}

#Preview {
    FollowingView()
}
