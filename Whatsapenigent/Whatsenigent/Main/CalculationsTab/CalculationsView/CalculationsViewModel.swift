//
//  CalculationsViewModel.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import Foundation

extension CalculationsView {
    final class CalculationsViewModel: ObservableObject {
        @Published var showProfile = false
        @Published var showNotifications = false
        @Published var viewState: CalculationSection = .marketConditions(state: .new)
        
        @Published var marketConditionsState: CalculationSectionState = .new
        @Published var riskAssessmentState: CalculationSectionState = .new
        @Published var calculatingNetBenefitsState: CalculationSectionState = .new
        @Published var rateTimeState: CalculationSectionState = .new
        @Published var decisionMakingState: CalculationSectionState = .new
        
        @Published var numberOfBuyers: String = ""
        @Published var purchasedByByer: String = ""
        @Published var times: String = ""
        @Published var price: String = ""
    }
}

extension CalculationsView {
    enum CalculationSection {
        case marketConditions(state: CalculationSectionState)
        case riskAssessment(state: CalculationSectionState)
        case calculatingNetBenefits(state: CalculationSectionState)
        case rateTime(state: CalculationSectionState)
        case decisionMaking(state: CalculationSectionState)
        
        var imageName: String {
            switch self {
            case .marketConditions:
                return Asset.estimateFutureMarketConditions.name
            case .riskAssessment:
                return Asset.riskAssessment.name
            case .calculatingNetBenefits:
                return Asset.calculatingNetBenefits.name
            case .rateTime:
                return Asset.rateTime.name
            case .decisionMaking:
                return Asset.formulaDecisionMaking.name
            }
        }
        
        var title: String {
            switch self {
            case .marketConditions:
                return "Oszacuj przyszłe warunki rynkowe"
            case .riskAssessment:
                return "Ocena ryzyka"
            case .calculatingNetBenefits:
                return "Obliczanie korzyści netto"
            case .rateTime:
                return "Oceń czas"
            case .decisionMaking:
                return "Wzór na podejmowanie decyzji"
            }
        }
        
        var state: CalculationSectionState {
            switch self {
            case .marketConditions(let state):
                return state
            case .riskAssessment(let state):
                return state
            case .calculatingNetBenefits(let state):
                return state
            case .rateTime(let state):
                return state
            case .decisionMaking(let state):
                return state
            }
        }
    }
    
    enum CalculationSectionState {
        case new, inProgress, finish
    }
}
