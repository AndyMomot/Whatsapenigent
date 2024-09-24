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
                            switch viewModel.viewState {
                            case .marketConditions:
                                MarketDemandView(
                                    numberOfBuyers: $viewModel.numberOfBuyers,
                                    purchasedByByer: $viewModel.purchasedByByer,
                                    times: $viewModel.times,
                                    price: $viewModel.price)
                                .padding(.horizontal)
                            case .riskAssessment:
                                EmptyView()
                            case .calculatingNetBenefits:
                                EmptyView()
                            case .rateTime:
                                EmptyView()
                            case .decisionMaking:
                                EmptyView()
                            }
                            
                            NextButtonView(title: "Dalej") {
                                
                            }
                            .frame(height: 63)
                            .padding()
                            
                            Spacer(minLength: bounds.width * 0.3)
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
                        
                        VStack {
                            Spacer()
                            ScrollView(.horizontal) {
                                HStack {
                                    CalculationSectionView(
                                        item: .marketConditions(state: viewModel.marketConditionsState)) {
                                        
                                    }
                                    .frame(width: bounds.width * 0.25)
                                    
                                    CalculationSectionView(item: .marketConditions(state: .new)) {
                                        
                                    }
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
                .scrollIndicators(.never)
            }
        }
    }
}

#Preview {
    CalculationsView()
}
