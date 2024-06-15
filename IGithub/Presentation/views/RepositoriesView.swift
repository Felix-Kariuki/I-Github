//
//  RepositoriesView.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import SwiftUI

struct RepositoriesView: View {
    

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var username: String = "Felix-Kariuki"
    
    @StateObject var viewModel =
    RepositoriesViewModelImpl(getUserRepositories: GetUserRepositoriesRepoImpl())
    
    
    var body: some View {
        VStack(alignment: .leading){
            NavigationView {
                
                Group {
                    switch viewModel.state {
                    case .loading:
                        ProgressView()
                        
                    case .failed(let error):
                        Text("Error ... \(error.localizedDescription)")
                        
                    case .success( _):
                        ScrollView {
                            VStack {
                                ForEach(viewModel.userRepos, id: \.id){repo in
                                    
                                        RepositoryComponent(repo: repo)
                                
                                }
                            }
                        }
                    }
                }
            }
            .onAppear{
                self.viewModel.getUserRepositories(userName: username)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomReposBackButton(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    },userName: username,title: "Repositories")
                    //CustomBackButton(dismiss: self.dismiss)
                }
            }
            
        }
    }
}

#Preview {
    RepositoriesView(username: "")
}
