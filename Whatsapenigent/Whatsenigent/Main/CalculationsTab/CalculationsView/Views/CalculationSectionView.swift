//
//  CalculationSectionView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct CalculationSectionView: View {
    var item: CalculationsView.CalculationSection
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                Text(item.title)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 10))
                    .multilineTextAlignment(.center)
            }
            .padding(10)
            .background(
                item.state == .new ? Colors.aqua.swiftUIColor : Colors.greenLite.swiftUIColor
            )
            .cornerRadius(18, corners: .allCorners)
            .opacity(item.state == .finish ? 0.5 : 1)
            .overlay {
                if item.state == .finish {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(.white, lineWidth: 2)
                            .padding(6)
                    }
                }
            }
        }
    }
}

#Preview {
    CalculationSectionView(item: .marketConditions(state: .finish)) {}
        .frame(maxWidth: 100, maxHeight: 95)
}
