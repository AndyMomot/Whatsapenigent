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
        @Published var showCalculateEmployerCosts = false
        
        @Published var employeeCostsResultItems: [EmployeeCostsModel] = []
        
        func getEmployeeCostsResults() async {
            let items = DefaultsService.employeeCosts.sorted(by: { $0.date > $1.date })
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.employeeCostsResultItems = items
            }
        }
        
        func deleteEmployeeCosts(item: EmployeeCostsModel) async {
            let items = DefaultsService.employeeCosts
            if let index = items.firstIndex(where: { item.id == $0.id }) {
                DefaultsService.employeeCosts.remove(at: index)
            }
            
            Task {
                await getEmployeeCostsResults()
            }
        }
    }
}
