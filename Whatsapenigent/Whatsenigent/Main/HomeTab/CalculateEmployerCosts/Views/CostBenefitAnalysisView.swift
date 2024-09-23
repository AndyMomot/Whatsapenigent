//
//  CostBenefitAnalysisView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct CostBenefitAnalysisView: View {
    @Binding var employmentCosts: String
    @Binding var trainingCosts: String
    @Binding var implementationCosts: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Asset.costBenefitAnalysisSubview.swiftUIImage
                }
                
                VStack(spacing: 10) {
                    VStack(spacing: .zero) {
                        HStack {
                            Spacer()
                            Text("Analiza kosztów i korzyści")
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                            Spacer()
                        }
                        .padding(.vertical, 20)
                        .background(Colors.blackCustom.swiftUIColor)
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        
                        CustomGreedViewRow(
                            title: "Koszty zatrudnienia",
                            subtitles: [
                                "- Reklama ofert pracy",
                                "- Opłaty agencji rekrutacyjnych",
                                "- Koszty rozmów kwalifikacyjnych (np. czas pracy personelu, zaplecze)",
                                "- Weryfikacja przeszłości",
                            ],
                            value: $employmentCosts
                        )
                        
                        CustomGreedViewRow(
                            title: "Koszty szkolenia",
                            subtitles: [
                                "- Materiały szkoleniowe",
                                "- Honoraria trenerów",
                                "- Czas pracownika (koszty wynagrodzeń w trakcie szkolenia)"
                            ],
                            value: $trainingCosts
                        )
                        
                        CustomGreedViewRow(
                            title: "Koszty wdrożenia",
                            subtitles: [
                                "- Koszty administracyjne (np. papierkowa robota, oprogramowanie)",
                                "- Programy orientacyjne",
                                "- Początkowy sprzęt lub oprogramowanie"
                            ],
                            value: $implementationCosts
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    Asset.waveArrow.swiftUIImage
                    
                    NextButtonView(title: "Dalej") {
                        action()
                    }
                    .frame(height: 74)
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
                .padding(.vertical, 14)
            }
        }
        .padding(.vertical, 14)
        .background(.white)
        .cornerRadius(48, corners: .allCorners)
        .shadow(radius: 10)
    }
}

#Preview {
    CostBenefitAnalysisView(
        employmentCosts: .constant(""),
        trainingCosts: .constant(""),
        implementationCosts: .constant("")) {}
}
