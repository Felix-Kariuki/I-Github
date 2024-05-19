//
//  FollowerComponent.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct UserComponent: View {
    
    let user: UserResponse
    
    var body: some View {
        
        VStack(
            alignment:.leading
        ){
            HStack(spacing: 16){
                
                CircularImageView(imageUrl: user.avatarURL ?? "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png",showBorder: true,borderWidth: 0.1,shadow: 0.1)
                
                VStack(alignment:.leading,spacing: 4){
                    IGithubText(text:"Felix Kariuki",
                                fontFamily:Fonts.nunitoBold,
                                fontSize: 16)
                    
                    IGithubText(text:"Felix-Kariuki",fontFamily:Fonts.nunitoMedium, fontSize: 14,textColor: .gray)
                }
                Spacer()
            }
            
            IGithubText(text: user.bio ?? "No Bio")
            
            Spacer().frame(height: 16)
            
            VStack(spacing: 4){
                if let location = user.location{
                    TextIconRow(image: "mappin",text: location)
                }
                
                if let blog = user.blog{
                    TextIconRow(text: blog ,fontFamily: Fonts.nunitoBold,textColor: .black)
                }
                
                if let email = user.email{
                    TextIconRow(image:"envelope",text: email,fontFamily: Fonts.nunitoBold,textColor: .black)
                }
                
                if let username = user.twitterUsername{
                    TextIconRow(text: username,fontFamily:Fonts.nunitoBold,textColor: .black)
                    
                    TextIconRow(text: username)
                }
                
                /**
                 *TODO : Add followers and following count
                 */
                
                let publicReposCount = user.publicRepos ?? 0
                let ownedPrivateReposCount = user.ownedPrivateRepos ?? 0
                let totalCount = publicReposCount + ownedPrivateReposCount
                
                
                Spacer().frame(height: 16)
                
                BottomTextIconRow(image: "text.book.closed",text: "Repositories",count: totalCount)
                Spacer().frame(height: 12)
                BottomTextIconRow(image:"building.2",text : "Organizations",count: user.collaborators ?? 0,backgroundColor: Color.orange)
                Spacer().frame(height: 12)
                BottomTextIconRow(image: "star",text: "Starred",backgroundColor: Color.yellow)
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

struct BottomTextIconRow: View {
    var image: String = "link"
    var text: String = "Maven central"
    var count:Int = 12
    var fontFamily: String = Fonts.nunitoRegular
    var imageColor:Color = Color.white
    var textColor:Color = Color.black
    var countColor:Color = Color.gray
    var iconSize:CGFloat = 22
    var backgroundColor = Color.black.opacity(0.7)
    
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Rectangle()
                    .fill(backgroundColor)
                    .cornerRadius(6)
                    .frame(width: 45,height: 48)
                
                Image(systemName: image)
        
                    .foregroundColor(imageColor).font(.system(size: iconSize))
            }
            
            
            IGithubText(text: text,fontFamily: fontFamily,textColor: textColor)
            Spacer()
        
            IGithubText(text: "\(count)",fontFamily: fontFamily,fontSize: 15,textColor: countColor)
        }
    }
}
#Preview {
    Group{
       // UserComponent(user: nil)
        
        TextIconRow()
        
        BottomTextIconRow()
    }
    .padding()
   
}
