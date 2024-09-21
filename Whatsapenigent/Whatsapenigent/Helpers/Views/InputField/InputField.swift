//
//  InputField.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import SwiftUI

struct InputField: View {
    var title: String
    var tintColor: Color
    @Binding var text: String
    var placeholder = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .foregroundStyle(tintColor)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
            
            TextField(text: $text) {
                Text(placeholder)
                    .foregroundStyle(tintColor.opacity(0.8))
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
            }
            .foregroundStyle(tintColor)
            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 16))
            .padding(.vertical)
            .padding(.horizontal, 12)
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(tintColor, lineWidth: 1)
            }
        }
    }
}

#Preview {
    ZStack {
        Colors.darkGray.swiftUIColor
        InputField(title: "Nicnemus",
                   tintColor: .white,
                   text: .constant(""))
        .padding()
    }
}
