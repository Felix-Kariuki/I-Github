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
                
                CircularImageView(imageUrl: user.avatarURL ?? "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png",
                                size: 80,  showBorder: true,borderWidth: 0.1,shadow: 0.1)
                
                VStack(alignment:.leading,spacing: 4){
                    IGithubText(text:user.name ?? "",
                                fontFamily:Fonts.nunitoBold,
                                fontSize: 16)
                    
                    IGithubText(text:user.login ?? "",fontFamily:Fonts.nunitoMedium, fontSize: 14,textColor: .gray)
                }
                Spacer()
            }
            
            Spacer().frame(height: 8)
            
            IGithubText(text: user.bio ?? "No Bio",fontFamily: Fonts.nunitoBold)
            
            Spacer().frame(height: 16)
            
            VStack(alignment: .leading,spacing: 4){
                if let location = user.location{
                    TextIconRow(image: "mappin",text: location)
                }
                
                if let blog = user.blog{
                    TextIconRow(text: blog ,fontFamily: Fonts.nunitoSemiBold,textColor: .black)
                }
                
                if let email = user.email{
                    TextIconRow(image:"envelope",text: email,fontFamily: Fonts.nunitoSemiBold,textColor: .black)
                }
                
                if let username = user.twitterUsername{
                    TextIconRow(text: username,fontFamily:Fonts.nunitoBold,textColor: .black)
                    
                   // TextIconRow(text: username)
                }
                
                HStack{
                    let followers = user.followers ?? 0
                    let following = user.following ?? 0
                    
                    NavigationLink{
                        FollowersView(userName: user.login ?? "")
                    } label: {
                        TextIconRow(image: "person",text: "followers",extraText: "\(followers)")
                    }
                    
                    NavigationLink{
                        FollowingView(userName: user.login ?? "")
                    } label: {
                        TextIconRow(image: "person",text: "following",extraText: "\(following)",showIcon: false)
                    }
                }
                
                /**
                 *TODO : Add followers and following count
                 */
                
                let publicReposCount = user.publicRepos ?? 0
                let ownedPrivateReposCount = user.ownedPrivateRepos ?? 0
                let totalCount = publicReposCount + ownedPrivateReposCount
                
                
                Spacer().frame(height: 16)
                
                NavigationLink{
                    //TODO: View to navigate to
                    RepositoriesView(username: user.login ?? "")
                } label: {
                    BottomTextIconRow(image: "text.book.closed",text: "Repositories",count: totalCount)
                }
                
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
    var extraText:String = ""
    var showIcon:Bool  = true
    
    var body: some View {
        HStack(){
            if showIcon {
                Image(systemName: image)
                    .foregroundColor(imageColor)
            }
            if !extraText.isEmpty{
                IGithubText(text: extraText,fontFamily: Fonts.nunitoSemiBold,textColor: textColor)
            }
            IGithubText(text: text,fontFamily: fontFamily,textColor: textColor)
           // Spacer()
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
    var iconSize:CGFloat = 18
    var backgroundColor = Color.black.opacity(0.7)
    
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Rectangle()
                    .fill(backgroundColor)
                    .cornerRadius(6)
                    .frame(width: 39,height: 42)
                
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
