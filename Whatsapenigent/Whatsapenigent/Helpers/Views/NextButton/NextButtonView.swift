//
//  NextButtonView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import SwiftUI

struct NextButtonView: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Dalej")
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 24))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Spacer()
                }
                Spacer()
            }
            .background(Colors.greenLite.swiftUIColor)
            .cornerRadius(15, corners: .allCorners)
        }

    }
}

#Preview {
    NextButtonView(title: "123") {
        
    }
    .padding(.horizontal)
    .frame(height: 74)
}
