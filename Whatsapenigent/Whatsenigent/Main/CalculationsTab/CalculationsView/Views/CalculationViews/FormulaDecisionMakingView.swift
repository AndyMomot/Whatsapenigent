//
//  FormulaDecisionMakingView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 26.09.2024.
//

import SwiftUI

struct FormulaDecisionMakingView: View {
    @Binding var netBenefit: String
    @Binding var timeSensitivityFactor: String
    @Binding var fullName: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Wzór na podejmowanie decyzji")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25) {
                CalculationField(
                    title: "Net Benefit",
                    text: $netBenefit)
                .frame(height: 35)
                
                CalculationField(
                    title: "Time Sensitivity Factor",
                    text: $timeSensitivityFactor)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Pełne imię i nazwisko",
                    placeholder: "Wpisz swoje pełne imię i nazwisko",
                    text: $fullName,
                    keyboardType: .default
                )
                .frame(maxHeight: 35)
            }
        }
    }
}

#Preview {
    FormulaDecisionMakingView(
        netBenefit: .constant(""),
        timeSensitivityFactor: .constant(""),
        fullName: .constant(""))
}
