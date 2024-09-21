//
//  LoginViewModel.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import Foundation

extension LoginView {
    final class LoginViewModel: ObservableObject {
        @Published var nickname = ""
        @Published var hobby = ""
        @Published var isValidFields = false
        
        func validateFields() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.isValidFields = !nickname.isEmpty && !hobby.isEmpty
            }
        }
        
        func safeUser(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self, self.isValidFields else { return }
                let model = UserModel(name: self.nickname, hobby: self.hobby)
                DefaultsService.user = model
                completion()
            }
        }
        
    }
}
