//
//  GetFollowingViewModel.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation
import Combine

protocol GetFollowingViewModel {
    func getFollowing(userName:String)
}


class GetFollowingViewModelImpl : ObservableObject,GetFollowingViewModel {
    
    private let getFollowingRepo : GetFollowingRepo
    
    private(set) var users = Users()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: FollowingState = .loading
    

    init(getFollowingRepo: GetFollowingRepo){
        self.getFollowingRepo = getFollowingRepo
    }
    
    @MainActor
    func getFollowing(userName:String){
        self.state = .loading
        
        
        let cancellable = getFollowingRepo.getFollowing(from: .getUserFollowing(userName: userName))
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .success(results: self.users)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.users = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
