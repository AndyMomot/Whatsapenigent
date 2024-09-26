//
//  CalculationsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct CalculationsView: View {
    @StateObject private var viewModel = CalculationsViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                NavigationView { action in
                    switch action {
                    case .profile:
                        viewModel.showProfile.toggle()
                    case .notifications:
                        viewModel.showNotifications.toggle()
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    ZStack {
                        VStack(spacing: 15) {
                            if viewModel.showResults {
                                CalculationResultView(
                                    income: viewModel.totalIncome,
                                    cost: viewModel.totalCost
                                )
                                .padding(.horizontal)
                            } else {
                                switch viewModel.viewState {
                                case .marketConditions:
                                    MarketDemandView(
                                        numberOfBuyers: $viewModel.numberOfBuyers,
                                        purchasedByByer: $viewModel.purchasedByByer,
                                        times: $viewModel.times,
                                        price: $viewModel.price)
                                    .padding(.horizontal)
                                case .riskAssessment:
                                    RiskAssessmentView(
                                        riskBias: $viewModel.riskBias,
                                        qualificationRisk: $viewModel.qualificationRisk,
                                        legalRisk: $viewModel.legalRisk,
                                        benefitAlternative: $viewModel.benefitAlternative,
                                        benefitOption: $viewModel.benefitOption)
                                    .padding(.horizontal)
                                case .calculatingNetBenefits:
                                    CalculatingNetBenefitsView(
                                        potentialBenefits: $viewModel.potentialBenefits,
                                        totalEmploymentCosts: $viewModel.totalEmploymentCosts)
                                    .padding(.horizontal)
                                case .rateTime:
                                    RateTimeView(
                                        totalBenefits: $viewModel.totalBenefits,
                                        totalCosts: $viewModel.totalCosts,
                                        costsIncreaseIfHiringPostponed: $viewModel.costsIncreaseIfHiringPostponed,
                                        benefitsIncreaseIfHiringDelayed: $viewModel.benefitsIncreaseIfHiringDelayed)
                                    .padding(.horizontal)
                                case .decisionMaking:
                                    FormulaDecisionMakingView(
                                        netBenefit: $viewModel.netBenefit,
                                        timeSensitivityFactor: $viewModel.timeSensitivityFactor,
                                        fullName: $viewModel.fullName)
                                    .padding(.horizontal)
                                }
                            }
                            
                            NextButtonView(title: viewModel.showResults ? "Zapisz wynik" : "Dalej") {
                                viewModel.onNextTapped()
                            }
                            .frame(height: 63)
                            .padding()
                            
                            if !viewModel.showResults {
                                Spacer(minLength: bounds.width * 0.3)
                            }
                        }
                        .padding(.top, 40)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white,
                                    Color.white,
                                    Color.white,
                                    Color.white,
                                    Colors.blackCustom.swiftUIColor
                                ]),
                                startPoint: .topTrailing,
                                endPoint: .bottomLeading
                            )
                        )
                        .cornerRadius(48, corners: [.topLeft, .bottomLeft])
                        .padding(.leading)
                        
                        if !viewModel.showResults {
                            VStack {
                                Spacer()
                                ScrollView(.horizontal) {
                                    HStack {
                                        CalculationSectionView(
                                            item: .marketConditions,
                                            viewState: viewModel.marketConditionsState) {
                                                withAnimation {
                                                    viewModel.viewState = .marketConditions
                                                }
                                            }
                                            .frame(width: bounds.width * 0.25)
                                        
                                        CalculationSectionView(
                                            item: .riskAssessment,
                                            viewState: viewModel.riskAssessmentState) {
                                                withAnimation {
                                                    viewModel.viewState = .riskAssessment
                                                }
                                            }
                                            .frame(width: bounds.width * 0.25)
                                            .disabled(viewModel.marketConditionsState != .finish)
                                        
                                        CalculationSectionView(
                                            item: .calculatingNetBenefits,
                                            viewState: viewModel.calculatingNetBenefitsState) {
                                                withAnimation {
                                                    viewModel.viewState = .calculatingNetBenefits
                                                }
                                            }
                                            .frame(width: bounds.width * 0.25)
                                            .disabled(viewModel.riskAssessmentState != .finish)
                                        
                                        CalculationSectionView(
                                            item: .rateTime,
                                            viewState: viewModel.rateTimeState) {
                                                withAnimation {
                                                    viewModel.viewState = .rateTime
                                                }
                                            }
                                            .frame(width: bounds.width * 0.25)
                                            .disabled(viewModel.calculatingNetBenefitsState != .finish)
                                        
                                        CalculationSectionView(
                                            item: .decisionMaking,
                                            viewState: viewModel.decisionMakingState) {
                                                withAnimation {
                                                    viewModel.viewState = .decisionMaking
                                                }
                                            }
                                            .disabled(viewModel.rateTimeState != .finish)
                                            .frame(width: bounds.width * 0.25)
                                    }
                                    .padding(.horizontal, 30)
                                }
                                .frame(height: bounds.width * 0.25)
                                .padding(.bottom, 15)
                                .scrollIndicators(.never)
                            }
                        }
                    }
                    
                    Spacer(minLength: bounds.height * 0.22)
                }
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    CalculationsView()
}
