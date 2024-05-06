//
//  FollowerComponent.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct UserComponent: View {
    var body: some View {
        
        VStack(
            alignment:.leading
        ){
            HStack(spacing: 16){
                
                CircularImageView(imageUrl: "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png",showBorder: true,borderWidth: 0.1,shadow: 0.1)
                
                VStack(alignment:.leading,spacing: 4){
                    IGithubText(text:"Felix Kariuki",
                                fontFamily:Fonts.nunitoBold,
                                fontSize: 16)
                    
                    IGithubText(text:"Felix-Kariuki",fontFamily:Fonts.nunitoMedium, fontSize: 14,textColor: .gray)
                }
                Spacer()
            }
            
            IGithubText(text: "Mobile Engineer")
            
            Spacer().frame(height: 16)
            
            VStack(spacing: 4){
                TextIconRow()
                TextIconRow(text: "https://linktr.ee/felixkariuki",fontFamily: Fonts.nunitoBold,imageColor: .black,textColor: .black)
                TextIconRow(text: "https://linktr.ee/felixkariuki",fontFamily: Fonts.nunitoBold,imageColor: .black,textColor: .black)
                TextIconRow()
                TextIconRow()
            }
            
            
        }
       
        
    }
}


struct TextIconRow: View {
    var image: String = "link"
    var text: String = "Maven central"
    var fontFamily: String = Fonts.nunitoRegular
    var imageColor:Color = Color.gray
    var textColor:Color = Color.gray
    
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: image)
                .foregroundColor(imageColor)
            IGithubText(text: text,fontFamily: fontFamily,textColor: textColor)
            Spacer()
        }
    }
}

#Preview {
    Group{
        UserComponent()
        
        TextIconRow()
    }
    .padding()
   
}
