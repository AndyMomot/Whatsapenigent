//
//  CostsCalculationResultView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct CostsCalculationResultView: View {
    var employmentСosts: Int
    var trainingCosts: Int
    var implementationCosts: Int
    
    var increasedProductivity: Int
    var improvingRetentionRates: Int
    var increasedRevenueRoles: Int
    var action: (Action) -> Void
    
    private var totalEmploymentTrainingCosts: Int {
        employmentСosts + trainingCosts + implementationCosts
    }
    
    private var totalPotentialBenefits: Int {
        increasedProductivity + improvingRetentionRates + increasedRevenueRoles
    }
    
    var body: some View {
        Asset.costAnalysisBg.swiftUIImage
            .resizable()
            .scaledToFit()
            .overlay {
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
                        
                        Rectangle()
                            .stroke(Colors.blackCustom.swiftUIColor, lineWidth: 2)
                            .padding(.horizontal, 2)
                            .overlay {
                                HStack {
                                    Spacer()
                                    Asset.costsCalculationResultSubview.swiftUIImage
                                }
                            }
                            .overlay {
                                VStack(alignment: .leading, spacing: 20) {
                                    HStack {
                                        Text("Całkowite koszty zatrudnienia i szkolenia")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                                        +
                                        Text(" = \(employmentСosts) + \(trainingCosts) + \(implementationCosts) = \(totalEmploymentTrainingCosts)")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                                        Spacer()
                                    }
                                    .minimumScaleFactor(0.8)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Potencjalne korzyści:")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                                        Group {
                                            Text("•     Zwiększona produktywność: \(increasedProductivity)")
                                            Text("•     Poprawa wskaźnika retencji: \(improvingRetentionRates)")
                                            Text("•     Zwiększone przychody z nowych ról: \(increasedRevenueRoles)")
                                            
                                        }
                                        .foregroundColor(.black)
                                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                                    }
                                    .minimumScaleFactor(0.8)
                                    
                                    HStack {
                                        Text("Całkowite potencjalne korzyśc")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                                        +
                                        Text(" = \(increasedProductivity) + \(improvingRetentionRates) + \(increasedRevenueRoles) = \(totalPotentialBenefits)")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                                        Spacer()
                                    }
                                    .minimumScaleFactor(0.8)
                                    
                                    HStack {
                                        Text("Korzyść netto")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 12))
                                        +
                                        Text(" = \(totalPotentialBenefits) - \(totalEmploymentTrainingCosts) = \(totalPotentialBenefits - totalEmploymentTrainingCosts)")
                                            .foregroundColor(.black)
                                            .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                                        Spacer()
                                    }
                                    .minimumScaleFactor(0.8)
                                    
                                    Spacer()
                                }
                                .padding(17)
                            }
                    }
                    .padding(.horizontal, 24)
                    
                    Asset.waveArrowFinish.swiftUIImage
                    
                    VStack(spacing: 20) {
                        NextButtonView(title: "Dalej") {
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
}

extension CostsCalculationResultView {
    enum Action {
        case back, next
    }
}

#Preview {
    CostsCalculationResultView(
        employmentСosts: 5000,
        trainingCosts: 3000,
        implementationCosts: 2000,
        increasedProductivity: 12000,
        improvingRetentionRates: 2000,
        increasedRevenueRoles: 5000
    ) {_ in}
}
