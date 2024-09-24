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
        
        private var totalEmploymentTrainingCosts: Int {
            (Int(employmentCosts) ?? .zero) +
            (Int(trainingCosts) ?? .zero) +
            (Int(implementationCosts) ?? .zero)
        }
        
        private var totalPotentialBenefits: Int {
            (Int(increasedProductivity) ?? .zero) +
            (Int(improvingRetentionRates) ?? .zero) +
            (Int(increasedRevenueRoles) ?? .zero)
        }
        
        private var netBenefit: Int {
            totalPotentialBenefits - totalEmploymentTrainingCosts
        }
        
        var isFieldAllFields: Bool {
            Int(employmentCosts) != nil &&
            Int(trainingCosts) != nil &&
            Int(implementationCosts) != nil &&
            
            Int(increasedProductivity) != nil &&
            Int(improvingRetentionRates) != nil &&
            Int(increasedRevenueRoles) != nil
        }
        
        func addItem(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self, self.isFieldAllFields else { return }
                let model = EmployeeCostsModel(
                    employmentCosts: Int(employmentCosts) ?? .zero,
                    trainingCosts: Int(trainingCosts) ?? .zero,
                    implementationCosts: Int(implementationCosts) ?? .zero,
                    
                    increasedProductivity: Int(increasedProductivity) ?? .zero,
                    improvingRetentionRates: Int(improvingRetentionRates) ?? .zero,
                    increasedRevenueRoles: Int(increasedRevenueRoles) ?? .zero,
                    
                    netBenefit: netBenefit
                )
                DefaultsService.employeeCosts.append(model)
                completion()
            }
        }
    }
}

extension CalculateEmployerCostsView {
    enum ViewState {
        case costBenefitAnalysis
        case potentialBenefits
        case result
    }
}
