//
//  RepositoriesViewModel.swift
//  IGithub
//
//  Created by Felix kariuki on 28/04/2024.
//

import Foundation
import Combine

protocol RepositoriesViewModel {
    func getUserRepositories(userName:String)
}



class RepositoriesViewModelImpl : ObservableObject,RepositoriesViewModel {
    
    private let getUserRepositoriesRepo : GetUserRepositoriesRepo
    
    private(set) var userRepos = Repositories()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: RepositoriesState = .loading
    

    init(getUserRepositories: GetUserRepositoriesRepo){
        self.getUserRepositoriesRepo = getUserRepositories
    }
    
    @MainActor
    func getUserRepositories(userName:String){
        self.state = .loading
        
        
        let cancellable = getUserRepositoriesRepo.getUserRepositories(from: .getUserRepos(userName: userName))
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .success(results: self.userRepos)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.userRepos = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
