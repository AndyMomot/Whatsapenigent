//
//  HomeView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewViewModel()
    
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
                    
                    ScrollView {
                        VStack {
                            
                        }
                    }
                    .scrollIndicators(.never)
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
