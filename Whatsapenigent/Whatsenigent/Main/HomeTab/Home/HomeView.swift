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
                            VStack {
                                ForEach(0..<10) { index in
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.yellow)
                                        .frame(height: 200)
                                }
                            }
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
