//
//  CalculationsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import SwiftUI

struct CalculationsView: View {
    @StateObject private var viewModel = CalculationsViewModel()
    
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
                    VStack(spacing: 15) {
                        
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
