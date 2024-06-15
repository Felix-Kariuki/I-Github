//
//  UserProfileView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var viewModel = GetUserViewModel(getUserRepo: GetUserRepoImpl())
    var userName:String = "Felix-Kariuki"
    
    var body: some View {
        NavigationView{
        VStack(alignment:.leading){
        
            UserComponent(user: viewModel.user)
            
            Spacer()
             
            }
        .padding()
            
        }
        .onAppear{
            self.viewModel.getUser(userName: userName)
        }
        .navigationBarBackButtonHidden(true)
     
    }
}

struct CustomReposBackButton: View {
    
    let action:() -> Void
    var userName:String = ""
    var title:String = ""


    var body: some View {
       
            HStack{
                Button(action: {
                    // Handle custom back button action
                    
                    action()
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.gray)
                }
                Spacer().frame(width: 24)
                VStack(alignment:.leading,spacing: 4){
                    IGithubText(text: userName,textColor: .gray)
                    IGithubText(text: title,
                                fontFamily: Fonts.nunitoMedium,fontSize:16)
                }
                
                
                Spacer()
            
        }

    }
}
#Preview {
    CustomReposBackButton(action: {},userName: "Felix-Kariuki",title: "Repositories")
}
#Preview {
    Group{
        UserProfileView()
        
        CustomReposBackButton(action: {},userName: "Felix-Kariuki",title: "Repositories")
    }
 
}
