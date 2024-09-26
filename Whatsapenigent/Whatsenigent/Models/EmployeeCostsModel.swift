//
//  EmployerCostsModel.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 24.09.2024.
//

import Foundation

struct EmployeeCostsModel: Codable, Identifiable {
    private(set) var id = UUID().uuidString
    private(set) var date = Date()
    var name: String = "Pracownik"
    var netBenefit: Int
}
