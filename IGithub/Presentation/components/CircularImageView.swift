//
//  CircularImageView.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI
/**
 * - TODO:
 *  Add a custom shimmer background
 */

struct CircularImageView: View {
    var imageUrl:String
    var size:CGFloat = 100
    @State var showBorder: Bool = false
    var borderWidth: CGFloat = 1
    var shadow: CGFloat = 1
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){phase in
            switch phase {
            case .empty:
                ProgressView().frame(minWidth: size,minHeight: size)
            case .success(let image):
                image.resizable()
                    .scaledToFill()
                    .frame(width: size,height: size)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(showBorder ? Circle().stroke(Color.white, lineWidth: borderWidth) : nil)
                    .shadow( radius: showBorder ? shadow : 0)
            case .failure(_):
                Image(systemName: "questionmark.diamond").imageScale(.large)
            @unknown default:
                Image(systemName: "exclamationmark.triangle.fill").imageScale(.large)
            }
        }
    }
}

#Preview {
    CircularImageView(imageUrl: "https://www.webfx.com/wp-content/uploads/2022/08/github-logo.png")
}
