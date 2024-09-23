//
//  PotentialBenefitsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct PotentialBenefitsView: View {
    @Binding var increasedProductivity: String
    @Binding var improvingRetentionRates: String
    @Binding var increasedRevenueRoles: String
    var action: (Action) -> Void
    
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
                            Text("Potencjalne korzyści")
                                .foregroundStyle(.white)
                                .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                            Spacer()
                        }
                        .padding(.vertical, 20)
                        .background(Colors.blackCustom.swiftUIColor)
                        .cornerRadius(40, corners: [.topLeft, .topRight])
                        
                        CustomGreedViewRow(
                            title: "Zwiększona produktywność",
                            subtitles: [
                                "Oszacuj wyniki lub poprawę efektywności dzięki zatrudnieniu nowego pracownika, zwykle mierzoną jako przychód lub usługa/wynik na pracownika.",
                            ],
                            value: $increasedProductivity
                        )
                        
                        CustomGreedViewRow(
                            title: "Poprawa wskaźnika retencji",
                            subtitles: [
                                "Oblicz wzrost wskaźników retencji i powiązane oszczędności kosztów wynikające ze zmniejszonej rotacji (w tym koszty zatrudnienia zastępców)."
                            ],
                            value: $improvingRetentionRates
                        )
                        
                        CustomGreedViewRow(
                            title: "Zwiększone przychody z nowych ról",
                            subtitles: [
                                "Oszacuj wszelkie nowe źródła dochodu lub dodatkowe przychody generowane przez nowego pracownika."
                            ],
                            value: $increasedRevenueRoles
                        )
                    }
                    .padding(.horizontal, 24)
                    
                    Asset.waveArrowFinish.swiftUIImage
                    
                    VStack(spacing: 20) {
                        NextButtonView(title: "swiftUIImage") {
                            action(.next)
                        }
                        .frame(height: 74)
                        .padding(.horizontal, 30)
                        
                        Button {
                            action(.back)
                        } label: {
                            Text("Z powrotem")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 24))
                        }
                    }
                    
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

extension PotentialBenefitsView {
    enum Action {
        case back, next
    }
}

#Preview {
    PotentialBenefitsView(
        increasedProductivity: .constant(""),
        improvingRetentionRates: .constant(""),
        increasedRevenueRoles: .constant("")) {_ in}
}
