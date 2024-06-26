//
//  FollowersView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct FollowersView: View {
    
    let userName:String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel = GetFollowersViewModel(getFollowingRepo: GetFollowersRepoImpl())
    
    var body: some View {
        NavigationView{
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                    
                case .failed(let error):
                    Text("Error ... \(error.localizedDescription)")
                    
                case .success( _):
                    ScrollView {
                        VStack {
                            ForEach(viewModel.users, id: \.id){user in
                                NavigationLink(destination: UserProfileView(userName:userName), label: {
                                    FollowerComponent(user: user)
                                })
                                   
                            
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            self.viewModel.getFollowing(userName:userName)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading) {
                CustomTitleview(action : {
                    self.presentationMode.wrappedValue.dismiss()
                },
                userName: userName,title: "Followers")
            }
        }
    }
}

struct CustomTitleview: View {
    
    let action:() -> Void
    var userName:String = ""
    var title:String = ""
    let showBackBtn :Bool = true


    var body: some View {
       
            HStack{
                if showBackBtn{
                    Button(action: {
                        // Handle custom back button action
                
                        action()
                    }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.gray)
                    }
                    
                    Spacer().frame(width: 24)
                }
                
                
                
            
                VStack(alignment:.leading,spacing: 4){
                    
                    IGithubText(text: userName,
                                fontFamily: Fonts.nunitoMedium,fontSize:16)
                    
                    
                    IGithubText(text: title,textColor: .gray)
                }
       
                
                Spacer()
            
        }


    }
}

#Preview {
    Group{
        FollowersView(userName: "Felix-Kariuki")
        
        CustomTitleview(action:{},userName: "Felix-Kariuki",title: "Following")
    }

}
