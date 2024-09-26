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
        @Published var showResults = false
        @Published var viewState: CalculationSection = .marketConditions
        
        @Published var marketConditionsState: CalculationSectionState = .inProgress
        @Published var riskAssessmentState: CalculationSectionState = .new
        @Published var calculatingNetBenefitsState: CalculationSectionState = .new
        @Published var rateTimeState: CalculationSectionState = .new
        @Published var decisionMakingState: CalculationSectionState = .new
        
        // MARK: - 1 ValidMarketDemandView
        @Published var numberOfBuyers = ""
        @Published var purchasedByByer = ""
        @Published var times = ""
        @Published var price = ""
        private var isValidMarketDemandFields: Bool {
            Int(numberOfBuyers) != nil &&
            Int(purchasedByByer) != nil &&
            Int(times) != nil &&
            Int(price) != nil
        }
        
        // MARK: - 2 ValidRiskAssessmentView
        @Published var riskBias = ""
        @Published var qualificationRisk = ""
        @Published var legalRisk = ""
        @Published var benefitAlternative = ""
        @Published var benefitOption = ""
        private var isValidRiskAssessmentFields: Bool {
            Int(riskBias) != nil &&
            Int(qualificationRisk) != nil &&
            Int(legalRisk) != nil &&
            Int(benefitAlternative) != nil &&
            Int(benefitOption) != nil
        }
        
        // MARK: - 3 ValidCalculatingNetBenefitsView
        @Published var potentialBenefits = ""
        @Published var totalEmploymentCosts = ""
        private var isValidCalculatingNetBenefitsFields: Bool {
            Int(potentialBenefits) != nil &&
            Int(totalEmploymentCosts) != nil
        }
        
        // MARK: - 4 ValidRateTimeView
        @Published var totalBenefits = ""
        @Published var totalCosts = ""
        @Published var costsIncreaseIfHiringPostponed = ""
        @Published var benefitsIncreaseIfHiringDelayed = ""
        private var isValidRateTimeFields: Bool {
            Int(totalBenefits) != nil &&
            Int(totalCosts) != nil &&
            !costsIncreaseIfHiringPostponed.isEmpty &&
            !benefitsIncreaseIfHiringDelayed.isEmpty
        }
        
        // MARK: - 5 ValidFormulaDecisionMakingView
        @Published var netBenefit = ""
        @Published var timeSensitivityFactor = ""
        @Published var fullName = ""
        private var isValidFormulaDecisionMakingFields: Bool {
            Int(netBenefit) != nil &&
            Int(timeSensitivityFactor) != nil &&
            !fullName.isEmpty
        }
        
        // MARK: - Results
        var marketDemand: Int {
            let a = Int(numberOfBuyers) ?? .zero
            let b = Int(purchasedByByer) ?? .zero
            let c = Int(price) ?? .zero
            return a * b * c
        }
        var hiringRiskAssessment: Int {
            let a = Int(riskBias) ?? .zero
            let b = Int(qualificationRisk) ?? .zero
            let c = Int(legalRisk) ?? .zero
            return a + b + c
        }
        var opportunityCost: Int {
            let a = Int(benefitAlternative) ?? .zero
            let b = Int(benefitOption) ?? .zero
            return a - b
        }
        var pureBenefit: Int {
            let a = Int(potentialBenefits) ?? .zero
            let b = Int(totalEmploymentCosts) ?? .zero
            return a - b
        }
        var immediateNetBenefit: Int {
            let a = Int(totalBenefits) ?? .zero
            let b = Int(totalCosts) ?? .zero
            return a - b
        }
       var costSolution: Int {
           let a = Int(netBenefit) ?? .zero
           let b = Int(timeSensitivityFactor) ?? .zero
           return a / b
       }
        
        var totalIncome: Int {
            marketDemand + pureBenefit + immediateNetBenefit
        }
        var totalCost: Int {
            hiringRiskAssessment + opportunityCost + costSolution
        }
        
        func onNextTapped() {
            if showResults {
                addItem()
                showResults = false
            } else {
                switch viewState {
                case .marketConditions:
                    guard isValidMarketDemandFields else { return } // 1
                    marketConditionsState = .finish
                    riskAssessmentState = .inProgress
                    viewState = .riskAssessment
                case .riskAssessment:
                    guard isValidRiskAssessmentFields else { return } // 2
                    riskAssessmentState = .finish
                    calculatingNetBenefitsState = .inProgress
                    viewState = .calculatingNetBenefits
                case .calculatingNetBenefits:
                    guard isValidCalculatingNetBenefitsFields else { return } // 3
                    calculatingNetBenefitsState = .finish
                    rateTimeState = .inProgress
                    viewState = .rateTime
                case .rateTime:
                    guard isValidRateTimeFields else { return } // 4
                    rateTimeState = .finish
                    decisionMakingState = .inProgress
                    viewState = .decisionMaking
                case .decisionMaking:
                    guard isValidFormulaDecisionMakingFields else { return } // 5
                    decisionMakingState = .finish
                    showResults = true
                }
            }
        }
        
        func addItem() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                let model = EmployeeCostsModel(
                    name: self.fullName,
                    netBenefit: self.totalIncome - self.totalCost
                )
                DefaultsService.employeeCosts.append(model)
                self.resetValues()
            }
        }
        
        private func resetValues() {
            viewState = .marketConditions
            marketConditionsState = .inProgress
            riskAssessmentState = .new
            calculatingNetBenefitsState = .new
            rateTimeState = .new
            decisionMakingState = .new
            
            numberOfBuyers = ""
            purchasedByByer = ""
            times = ""
            price = ""
            
            riskBias = ""
            qualificationRisk = ""
            legalRisk = ""
            benefitAlternative = ""
            benefitOption = ""
            
            potentialBenefits = ""
            totalEmploymentCosts = ""
            
            totalBenefits = ""
            totalCosts = ""
            costsIncreaseIfHiringPostponed = ""
            benefitsIncreaseIfHiringDelayed = ""
            
            netBenefit = ""
            timeSensitivityFactor = ""
            fullName = ""
        }
    }
}

extension CalculationsView {
    enum CalculationSection {
        case marketConditions
        case riskAssessment
        case calculatingNetBenefits
        case rateTime
        case decisionMaking
        
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
    }
    
    enum CalculationSectionState {
        case new, inProgress, finish
    }
}
