//
//  AwardsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 27.09.2024.
//

import SwiftUI

struct AwardsView: View {
    @StateObject private var viewModel = AwardsViewModel()
    private var widthIndex: CGFloat = 2.9
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
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
                                break
                            }
                        }
                        .padding(.horizontal)
                        
                        ScrollView {
                            VStack(spacing: 25) {
                                AwardsSection(
                                    title: "Nagrody za redukcję kosztów",
                                    items: viewModel.costReductionRewardsItems,
                                    width: geo.size.width / widthIndex
                                )
                                
                                AwardsSection(
                                    title: "Nagrody za lepszą wydajność",
                                    items: viewModel.rewardsBetterPerformanceItems,
                                    width: geo.size.width / widthIndex
                                )
                                
                                AwardsSection(
                                    title: "Nagrody za skuteczną optymalizację procesów pracy",
                                    items: viewModel.optimizationProcessesItems
                                    ,
                                    width: geo.size.width / widthIndex
                                )
                                
                                Spacer(minLength: bounds.height * 0.22)
                            }
                            .padding(.leading)
                        }
                        .scrollIndicators(.never)
                        
                        Spacer()
                    }
                }
            }
            .onAppear {
                Task {
                    await viewModel.getEmployeeCostsResults()
                }
            }
            .navigationDestination(isPresented: $viewModel.showProfile) {
                ProfileView()
            }
            .navigationDestination(isPresented: $viewModel.showNewAward) {
                if let award = viewModel.awardTypeToShow {
                    AwardAchievement(item: award)
                }
            }
        }
    }
}

#Preview {
    AwardsView()
}
