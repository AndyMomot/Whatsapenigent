//
//  HomeView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        NavigationStack {
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
                    
                    GeometryReader { geo in
                        ScrollView {
                            VStack(spacing: 10) {
                                VStack(spacing: 24) {
                                    Text("Aby przeanalizować koszty zatrudniania i szkolenia nowych pracowników oraz porównać te koszty z potencjalnymi korzyściami dla firmy, możesz posłużyć się następującym schematem:")
                                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                                        .multilineTextAlignment(.center)
                                    
                                    VStack(spacing: .zero) {
                                        Asset.waveArrow.swiftUIImage
                                        HStack {
                                            EmployeeCostsView(state: .first)
                                            Spacer(minLength: 23)
                                            EmployeeCostsView(state: .second)
                                        }
                                    }
                                    
                                    NextButtonView(title: "Rozpocznij") {
                                        
                                    }
                                    .frame(height: 74)
                                }
                                .padding(30)
                                .background(.white)
                                .cornerRadius(48, corners: .allCorners)
                            }
                            .padding(.horizontal)
                        }
                        .scrollIndicators(.never)
                        .padding(.bottom, geo.safeAreaInsets.bottom)
                    }
                }
            }
            .navigationDestination(isPresented: $viewModel.showProfile) {
                ProfileView()
            }
        }
    }
}

#Preview {
    HomeView()
}
