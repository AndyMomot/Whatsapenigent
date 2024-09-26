//
//  RiskAssessmentView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 26.09.2024.
//

import SwiftUI

struct RiskAssessmentView: View {
    @Binding var riskBias: String
    @Binding var qualificationRisk: String
    @Binding var legalRisk: String
    @Binding var benefitAlternative: String
    @Binding var benefitOption: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Ocena ryzyka")
                .foregroundStyle(.black)
                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                .multilineTextAlignment(.center)
            
            VStack(spacing: 25) {
                CalculationField(
                    title: "Ryzyko stronniczości",
                    text: $riskBias)
                .frame(height: 35)
                
                CalculationField(
                    title: "Ryzyko kwalifikacji",
                    text: $qualificationRisk)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Legal Risk",
                    text: $legalRisk)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Korzyść z najlepszej alternatywy",
                    text: $benefitAlternative)
                .frame(maxHeight: 35)
                
                CalculationField(
                    title: "Korzyść z wybranej opcji",
                    text: $benefitOption)
                .frame(maxHeight: 35)
            }
        }
    }
}

#Preview {
    RiskAssessmentView(
        riskBias: .constant(""),
        qualificationRisk: .constant(""),
        legalRisk: .constant(""),
        benefitAlternative: .constant(""),
        benefitOption: .constant(""))
    .padding(.horizontal)
}
