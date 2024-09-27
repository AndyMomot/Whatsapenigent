//
//  AwardsViewModel.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 27.09.2024.
//

import Foundation

extension AwardsView {
    final class AwardsViewModel: ObservableObject {
        @Published var showProfile = false
        
        @Published var costReductionRewardsItems: [AwardItem] = [
            .init(type: .costReduction1,
                  isAchieved: false),
            .init(type: .costReduction2,
                  isAchieved: false),
            .init(type: .costReduction3,
                  isAchieved: false)
        ]
        
        @Published var rewardsBetterPerformanceItems: [AwardItem] = [
            .init(type: .betterPerformance1,
                  isAchieved: false),
            .init(type: .betterPerformance2,
                  isAchieved: false),
            .init(type: .betterPerformance3,
                  isAchieved: false)
        ]
        
        @Published var optimizationProcessesItems: [AwardItem] = [
            .init(type: .effectiveOptimization1,
                  isAchieved: false),
            .init(type: .effectiveOptimization2,
                  isAchieved: false),
            .init(type: .effectiveOptimization3,
                  isAchieved: false)
        ]
        
        @Published var showNewAward = false
        var awardTypeToShow: AwardType?
        
        func getEmployeeCostsResults() async {
            let items = DefaultsService.employeeCosts
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.setIsAchievedStatuses(for: items.count)
                self.handleShowingAwardAchievement(index: items.count)
            }
        }
        
        func setIsAchievedStatuses(for count: Int) {
            switch count {
            case 1...3:
                for index in 0..<count {
                    costReductionRewardsItems[index].isAchieved = true
                }
            case 4...6:
                for index in 0..<costReductionRewardsItems.count {
                    costReductionRewardsItems[index].isAchieved = true
                }
                for index in 0..<count - 3 {
                    rewardsBetterPerformanceItems[index].isAchieved = true
                }
            case 7...:
                for index in 0..<costReductionRewardsItems.count {
                    costReductionRewardsItems[index].isAchieved = true
                }
                for index in 0..<rewardsBetterPerformanceItems.count {
                    rewardsBetterPerformanceItems[index].isAchieved = true
                }
                for index in 0..<count - 6 {
                    if index < optimizationProcessesItems.count {
                        optimizationProcessesItems[index].isAchieved = true
                    }
                }
            default:
                break
            }
        }
        
        func handleShowingAwardAchievement(index: Int) {
            let oldIndex = DefaultsService.awardIndex ?? .zero
            
            if oldIndex < index {
                if let award = AwardType.allCases.first(where: {
                    $0.index == index
                }) {
                    awardTypeToShow = award
                    showNewAward.toggle()
                }
                
                DefaultsService.awardIndex = index
            }
        }
    }
}

extension AwardsView {
    struct AwardItem {
        var type: AwardType
        var isAchieved: Bool
    }
    
    enum AwardType: CaseIterable {
        case costReduction1
        case costReduction2
        case costReduction3
        
        case betterPerformance1
        case betterPerformance2
        case betterPerformance3
        
        case effectiveOptimization1
        case effectiveOptimization2
        case effectiveOptimization3
        
        var smallImage: String {
            switch self {
            case .costReduction1:
                return Asset.costReductionRewards1.name
            case .costReduction2:
                return Asset.costReductionRewards2.name
            case .costReduction3:
                return Asset.costReductionRewards2.name
                
            case .betterPerformance1:
                return Asset.betterPerformance1.name
            case .betterPerformance2:
                return Asset.betterPerformance2.name
            case .betterPerformance3:
                return Asset.betterPerformance3.name
                
            case .effectiveOptimization1:
                return Asset.effectiveOptimization1.name
            case .effectiveOptimization2:
                return Asset.effectiveOptimization2.name
            case .effectiveOptimization3:
                return Asset.effectiveOptimization3.name
            }
        }
        
        var title: String {
            switch self {
            case .costReduction1, .betterPerformance1, .effectiveOptimization1:
                return "Nagroda pierwszego stopnia"
                
            case .costReduction2, .betterPerformance2, .effectiveOptimization2:
                return "Nagroda drugiego stopnia"
                
            case .costReduction3, .betterPerformance3, .effectiveOptimization3:
                return "Trzeci etap nagorod"
            }
        }
        
        var bgImage: String {
            switch self {
            case .costReduction1:
                return Asset.awardBg11.name
            case .costReduction2:
                return Asset.awardBg12.name
            case .costReduction3:
                return Asset.awardBg13.name
                
            case .betterPerformance1:
                return Asset.awardBg21.name
            case .betterPerformance2:
                return Asset.awardBg22.name
            case .betterPerformance3:
                return Asset.awardBg23.name
                
            case .effectiveOptimization1:
                return Asset.awardBg31.name
            case .effectiveOptimization2:
                return Asset.awardBg32.name
            case .effectiveOptimization3:
                return Asset.awardBg33.name
            }
        }
        
        var index: Int {
            switch self {
            case .costReduction1:
                return 1
            case .costReduction2:
                return 2
            case .costReduction3:
                return 3
            case .betterPerformance1:
                return 4
            case .betterPerformance2:
                return 5
            case .betterPerformance3:
                return 6
            case .effectiveOptimization1:
                return 7
            case .effectiveOptimization2:
                return 8
            case .effectiveOptimization3:
                return 9
            }
        }
    }
}
