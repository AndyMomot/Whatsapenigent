//
//  CalculatingNetBenefitsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 26.09.2024.
//

import SwiftUI

struct CalculatingNetBenefitsView: View {
    @Binding var potentialBenefits: String
    @Binding var totalEmploymentCosts: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Obliczanie korzyści netto")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25) {
                CalculationField(
                    title: "Potencjalne korzyści",
                    text: $potentialBenefits)
                .frame(height: 35)
                
                CalculationField(
                    title: "Całkowite koszty zatrudnienia",
                    text: $totalEmploymentCosts)
                .frame(maxHeight: 35)
            }
        }
    }
}

#Preview {
    CalculatingNetBenefitsView(
        potentialBenefits: .constant(""),
        totalEmploymentCosts: .constant("")
    )
}
