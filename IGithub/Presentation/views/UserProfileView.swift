//
//  UserProfileView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var viewModel =
    GetUserViewModelImpl(getUserRepo: GetUserRepoImpl())
    
    var body: some View {
        NavigationView{
        VStack(alignment:.leading){
        
            UserComponent(user: viewModel.user)
            
            Spacer()
             
            }
        .padding()
            
        }
        .onAppear{
            self.viewModel.getUser(userName: "Felix-Kariuki")
        }
        .navigationBarBackButtonHidden(true)
     
    }
}

struct CustomBackButton: View {
    var body: some View {
        HStack{
            Button(action: {
                // Handle custom back button action
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.blue)
            }
            
            IGithubText(text: "My text ")
        }
        
    }
}

#Preview {
    UserProfileView()
}
