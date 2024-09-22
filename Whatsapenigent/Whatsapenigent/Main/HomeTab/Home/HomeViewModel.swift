//
//  HomeViewModel.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import Foundation

extension HomeView {
    final class HomeViewViewModel: ObservableObject {
        @Published var showProfile = false
        @Published var showNotifications = false
    }
}
