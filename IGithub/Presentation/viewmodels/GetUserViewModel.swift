//
//  GetUserViewModel.swift
//  IGithub
//
//  Created by Felix kariuki on 15/05/2024.
//

import Foundation
import Combine

class GetUserViewModel : ObservableObject {
    
    private let getUserRepo : GetUserRepo
    
    private(set) var user = UserResponse()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: UserState = .loading
    

    init(getUserRepo: GetUserRepo){
        self.getUserRepo = getUserRepo
    }
    
    @MainActor
    func getUser(userName:String){
        self.state = .loading
        
        
        let cancellable = getUserRepo.getUser(from: .getUser(userName: userName))
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .success(result: self.user)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.user = response
            }
        
        self.cancellables.insert(cancellable)
    }
}
