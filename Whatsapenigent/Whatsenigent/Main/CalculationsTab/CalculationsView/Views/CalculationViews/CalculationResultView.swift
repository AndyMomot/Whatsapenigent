//
//  CalculationResultView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 26.09.2024.
//

import SwiftUI

struct CalculationResultView: View {
    var income: Int
    var cost: Int
    
    private var result: Int {
        income - cost
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Wynik")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 16))
                .multilineTextAlignment(.center)
            
            VStack(alignment: .leading, spacing: 45) {
                Text("Let's say hiring a new employee is expected to bring in \(income) in additional revenue and cost \(cost) in salary and benefits.")
                    .foregroundStyle(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                
                Text("Immediate Net Benefit")
                    .foregroundColor(.black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 14)) +
                Text(" = \(income) - \(cost) = \(result)")
                    .foregroundColor(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14))
                
                
                Text("This means the immediate net benefit of hiring the new employee is")
                    .foregroundColor(.black)
                    .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 14)) +
                Text(" \(result).")
                    .foregroundColor(.black)
                    .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 14))
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Colors.blackCustom.swiftUIColor, lineWidth: 2)
            }
        }
    }
}

#Preview {
    CalculationResultView(income: 150, cost: 100)
        .padding(.horizontal)
}
