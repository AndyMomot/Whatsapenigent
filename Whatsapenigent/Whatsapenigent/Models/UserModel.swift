//
//  UserModel.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import Foundation

struct UserModel: Codable {
    private(set) var id = UUID().uuidString
    var name, hobby: String
}
