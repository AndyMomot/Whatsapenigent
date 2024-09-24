//
//  CustomGreedViewRow.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct CustomGreedViewRow: View {
    var title: String
    var subtitles: [String]
    @Binding var value: String
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 12))
                
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(subtitles, id: \.self) { subtitle in
                        Text(subtitle)
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 8))
                    }
                }
                
                Spacer()
            }
            .padding(.top, 10)
            .padding(.leading, 10)
            .frame(width: bounds.width * 0.4)
            
            Spacer()
            
            Rectangle()
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .frame(width: 1)
            
            Spacer()
            
            TextField(text: $value) {
                Text("00...")
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.italic.swiftUIFont(size: 12))
                    .keyboardType(.numberPad)
            }
            .foregroundStyle(.white)
            .font(Fonts.SFProDisplay.italic.swiftUIFont(size: 12))
            .padding(7)
            .background(Colors.blackCustom.swiftUIColor)
            .cornerRadius(8, corners: .allCorners)
            .padding(.horizontal)
        }
        .border(Colors.blackCustom.swiftUIColor, width: 1)
    }
}

#Preview {
    CustomGreedViewRow(
        title: "Koszty zatrudnienia",
        subtitles: ["Reklama ofert pracy",
                    "Opłaty agencji rekrutacyjnych",
                    "Koszty rozmów kwalifikacyjnych (np. czas pracy personelu, zaplecze)",
                    "Weryfikacja przeszłości"],
        value: .constant("")
    )
    .frame(width: 302, height: 122)
}
