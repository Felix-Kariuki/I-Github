//
//  FollowingView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct FollowingView: View {
    
    let userName:String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    @StateObject var viewModel =
    GetFollowingViewModelImpl(getFollowingRepo: GetFollowingRepoImpl())
    
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
                userName: userName,title: "Following")
            }
        }
    }
}

#Preview {
    FollowingView(userName: "Felix-Kariuki")
}
