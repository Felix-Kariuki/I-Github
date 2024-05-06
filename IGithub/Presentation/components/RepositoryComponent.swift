//
//  RepositoryComponent.swift
//  IGithub
//
//  Created by Felix kariuki on 05/04/2024.
//

import SwiftUI

struct RepositoryComponent: View {
    
    let repo: Repository
    
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ){
            HStack{
                
                IGithubText(text:repo.name,fontFamily: Fonts.nunitoBold,fontSize: 16)
                Spacer()
                //                Capsule()
                //                    .stroke(Color.gray, lineWidth: 1)
                //                    .frame(width:50,height: 15)
                //                    .overlay(IGithubText(text:repo.visibility,fontSize: 10))
                
                
            }
            
            if let desc = repo.description {
                IGithubText(text: desc,fontFamily: Fonts.nunitoLight,fontSize: 14,textColor: .gray)
            }
            
            
            
            
            HStack(    alignment: VerticalAlignment.center, spacing: 8) {
                
                if let lang = repo.language {
                    IGithubText(text:lang,fontSize: 12)
                }
                
                
                HStack(
                    alignment: VerticalAlignment.center, spacing: 8
                ) {
                    Image(systemName: "star")
                        .font(.system(size: 12))
                    
                    IGithubText(text:"\(repo.stargazersCount)",fontSize: 12)
                }
                
                
                
            }
        }
        .padding()
        
    }
}


