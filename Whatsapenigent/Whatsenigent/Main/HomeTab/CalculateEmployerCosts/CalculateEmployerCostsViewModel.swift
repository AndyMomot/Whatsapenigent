//
//  CalculateEmployerCostsViewModel.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import Foundation

extension CalculateEmployerCostsView {
    final class CalculateEmployerCostsViewModel: ObservableObject {
        @Published var showProfile = false
        @Published var showNotifications = false
        
        @Published var employmentCosts = ""
        @Published var trainingCosts = ""
        @Published var implementationCosts = ""
        
        @Published var increasedProductivity = ""
        @Published var improvingRetentionRates = ""
        @Published var increasedRevenueRoles = ""
    }
}

extension CalculateEmployerCostsView {
    enum ViewState {
        case costBenefitAnalysis
        case potentialBenefits
        case result
    }
}
