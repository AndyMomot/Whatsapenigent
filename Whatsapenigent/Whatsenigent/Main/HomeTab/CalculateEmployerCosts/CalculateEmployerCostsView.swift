//
//  CalculateEmployerCostsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct CalculateEmployerCostsView: View {
    @StateObject private var viewModel = CalculateEmployerCostsViewModel()
    @State private var viewState: ViewState = .costBenefitAnalysis
    @Environment(\.dismiss) private var dismiss
    var onDismiss: () -> Void
    
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
                    switch viewState {
                    case .costBenefitAnalysis:
                        CostBenefitAnalysisView(
                            employmentCosts: $viewModel.employmentCosts,
                            trainingCosts: $viewModel.trainingCosts,
                            implementationCosts: $viewModel.implementationCosts) {
                                withAnimation {
                                    viewState = .potentialBenefits
                                }
                            }
                        .padding(.horizontal)
                    case .potentialBenefits:
                        PotentialBenefitsView(
                            increasedProductivity: $viewModel.increasedProductivity,
                            improvingRetentionRates: $viewModel.improvingRetentionRates,
                            increasedRevenueRoles: $viewModel.increasedRevenueRoles) { action in
                                switch action {
                                case .back:
                                    withAnimation {
                                        viewState = .costBenefitAnalysis
                                    }
                                case .next:
                                    withAnimation {
                                        viewState = .result
                                    }
                                }
                            }
                        .padding(.horizontal)
                    case .result:
                        CostsCalculationResultView(
                            employmentСosts: Int(viewModel.employmentCosts) ?? 0,
                            trainingCosts: Int(viewModel.trainingCosts) ?? 0,
                            implementationCosts: Int(viewModel.implementationCosts) ?? 0,
                            increasedProductivity: Int(viewModel.increasedProductivity) ?? 0,
                            improvingRetentionRates: Int(viewModel.improvingRetentionRates) ?? 0,
                            increasedRevenueRoles: Int(viewModel.increasedRevenueRoles) ?? 0) { action in
                                switch action {
                                case .back:
                                    withAnimation {
                                        viewState = .potentialBenefits
                                    }
                                case .next:
                                    viewModel.addItem {
                                        dismiss.callAsFunction()
                                        onDismiss()
                                    }
                                }
                            }
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: bounds.height * 0.22)
                }
                .scrollIndicators(.never)
            }
        }
        .hideKeyboardWhenTappedAround()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CalculateEmployerCostsView {}
}
