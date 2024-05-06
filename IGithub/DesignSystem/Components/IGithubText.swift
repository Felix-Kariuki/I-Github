//
//  IGithubText.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import SwiftUI

struct IGithubText: View {
    var text : String = "IGithub"
    var fontFamily: String = Fonts.nunitoRegular
    var fontSize: CGFloat = 14
    var textColor: Color = .black
    var fontWeight: Font.Weight = .regular
    
    var body: some View {
        Text(text).foregroundColor(textColor)
            .font(.custom(fontFamily, size: fontSize))
    }
}

#Preview {
    IGithubText(text: "GraphQlGithub")
}
