//
//  FollowerComponent.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct FollowerComponent: View {
    
    
    let user: UserResponse
 
    
    var body: some View {
        
        VStack(
            alignment:.leading
        ){
            HStack(
                spacing: 16
            ){
                CircularImageView(imageUrl: user.avatarURL ?? "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png",size: 60,showBorder: true,borderWidth: 0.1,shadow: 0.1)
                VStack(
                    alignment:.leading,
                    spacing: 2
                ){
                    IGithubText(text:user.login ?? "",
                                fontFamily:Fonts.nunitoSemiBold,
                                fontSize: 15)
                    
                    IGithubText(text:user.login ?? "",fontFamily:Fonts.nunitoLight, fontSize: 13,textColor: .gray)
                    
                    IGithubText(text:user.bio ?? "",fontFamily:Fonts.nunitoRegular, fontSize: 14,textColor: .gray)
                }
                Spacer()
            }
            
            
        }
        .padding()
        
    }
}



