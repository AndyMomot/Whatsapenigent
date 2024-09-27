//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation
import Combine

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        @Published var showPrivacyPolicy = false
        let ppUrl = URL(string: "https://whatsenigent.info/")
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var imageName: String {
            switch self {
            case .first:
                return Asset.onboard1.name
            case .second:
                return Asset.onboard2.name
            case .third:
                return Asset.onboard3.name
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return "Oceń opłacalność zatrudniania pracowników i inwestowania w rozwój zawodowy"
            case .second:
                return "Analizuj koszty zatrudnienia i przewidywane korzyści, aby dostarczać klientom trafne rekomendacje"
            case .third:
                return "Podejmuj decyzje o rozbudowie zespołu lub pracy z obecnym składem na podstawie analizy danych"
            }
        }
        
        var nextTitle: String {
            switch self {
            case .first, .second:
                return "Dalej"
            case .third:
                return "Rozpocznij"
            }
        }
        
        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
    }
}
