//
//  RateTimeView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 26.09.2024.
//

import SwiftUI

struct RateTimeView: View {
    @Binding var totalBenefits: String
    @Binding var totalCosts: String
    @Binding var costsIncreaseIfHiringPostponed: String
    @Binding var benefitsIncreaseIfHiringDelayed: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Oceń czas")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25) {
                CalculationField(
                    title: "Łączne korzyści",
                    text: $totalBenefits)
                .frame(height: 35)
                
                CalculationField(
                    title: "CKoszty całkowite",
                    text: $totalCosts)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Jakie koszty mogą wzrosnąć, jeśli zatrudnienie zostanie odroczone?",
                    placeholder: "Wprowadź dane...",
                    text: $costsIncreaseIfHiringPostponed,
                    keyboardType: .default
                )
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Czy potencjalne korzyści również wzrosną w przypadku opóźnienia zatrudnienia?",
                    placeholder: "Wprowadź dane...",
                    text: $benefitsIncreaseIfHiringDelayed,
                    keyboardType: .default
                )
                .frame(maxHeight: 35)
            }
        }
    }
}

#Preview {
    RateTimeView(
        totalBenefits: .constant(""),
        totalCosts: .constant(""),
        costsIncreaseIfHiringPostponed: .constant(""),
        benefitsIncreaseIfHiringDelayed: .constant(""))
}
