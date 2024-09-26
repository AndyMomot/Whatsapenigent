//
//  CalculationSectionView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct CalculationSectionView: View {
    var item: CalculationsView.CalculationSection
    var viewState: CalculationsView.CalculationSectionState
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
                viewState == .new ? Colors.aqua.swiftUIColor : Colors.greenLite.swiftUIColor
            )
            .cornerRadius(18, corners: .allCorners)
            .opacity(viewState == .finish ? 0.5 : 1)
            .overlay {
                if viewState == .finish {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(.white, lineWidth: 2)
                            .padding(6)
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    CalculationSectionView(item: .marketConditions, viewState: .new) {}
        .frame(maxWidth: 100, maxHeight: 95)
}
