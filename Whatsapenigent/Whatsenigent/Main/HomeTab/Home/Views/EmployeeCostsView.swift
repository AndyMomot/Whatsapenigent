//
//  EmployeeCostsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct EmployeeCostsView: View {
    var state: State
    
    var body: some View {
        RoundedRectangle(cornerRadius: 33)
            .scaledToFit()
            .foregroundStyle(Colors.blackCustom.swiftUIColor)
            .overlay {
                VStack(spacing: 10) {
                    Image(state.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 50)
                    
                    Text(state.title)
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                .padding(22)
            }
    }
}

extension EmployeeCostsView {
    enum State {
        case first
        case second
        
        var image: String {
            switch self {
            case .first:
                return Asset.employerCostsFirstState.name
            case .second:
                return Asset.employerCostsSecondState.name
            }
        }
        
        var title: String {
            switch self {
            case .first:
                return "Analiza kosztów i korzyści"
            case .second:
                return "Potencjalne korzyści"
            }
        }
    }
}

#Preview {
    HStack {
        EmployeeCostsView(state: .first)
            .frame(width: 146)
        
        EmployeeCostsView(state: .second)
            .frame(width: 146)
    }
}
