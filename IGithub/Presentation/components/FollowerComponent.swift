//
//  FollowerComponent.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct FollowerComponent: View {
    
 
    
    var body: some View {
        
        VStack(
            alignment:.leading
        ){
            HStack(
                spacing: 16
            ){
                CircularImageView(imageUrl: "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png",showBorder: true,borderWidth: 0.1,shadow: 0.1)
                VStack(
                    alignment:.leading,
                    spacing: 2
                ){
                    IGithubText(text:"Felix Kariuki",
                                fontFamily:Fonts.nunitoBold,
                                fontSize: 20)
                    
                    IGithubText(text:"Felix-Kariuki",fontFamily:Fonts.nunitoLight, fontSize: 15,textColor: .gray)
                    
                    IGithubText(text:" I am a seasoned mobile engineer with extensive experience",fontFamily:Fonts.nunitoRegular, fontSize: 15,textColor: .gray)
                }
                Spacer()
            }
            
            
        }
        .padding()
        
    }
}

#Preview {
  
    FollowerComponent()
}


