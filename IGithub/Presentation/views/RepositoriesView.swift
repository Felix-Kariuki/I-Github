//
//  RepositoriesView.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import SwiftUI

struct RepositoriesView: View {
    
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
                                    NavigationLink{
                                        //TODO: View to navigate to
                                    } label: {
                                        RepositoryComponent(repo: repo)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .onAppear{
                self.viewModel.getUserRepositories(userName: "Felix-Kariuki")
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    RepositoriesView()
}
