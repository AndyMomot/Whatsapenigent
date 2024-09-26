//
//  CalculationField.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct CalculationField: View {
    var title: String
    var placeholder = "00..."
    @Binding var text: String
    var keyboardType: UIKeyboardType = .numberPad
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
            HStack {
                Text(title)
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 10))
                    .padding(.horizontal)
                
                Spacer()
                
                TextField(text: $text) {
                    Text(placeholder)
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.italic.swiftUIFont(size: 12))
                }
                .keyboardType(keyboardType)
                .padding()
                .background(Colors.blackCustom.swiftUIColor)
                .foregroundStyle(.white)
                .font(Fonts.SFProDisplay.italic.swiftUIFont(size: 12))
                .cornerRadius(8, corners: .allCorners)
                .frame(width: bounds.width * 0.458)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Colors.blackCustom.swiftUIColor, lineWidth: 1)
            }
    }
}

#Preview {
    CalculationField(
        title: "Liczba potencjalnych nabywców",
        text: .constant(""))
    .padding(.horizontal, 32)
}
