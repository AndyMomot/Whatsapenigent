//
//  LoginView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    
    var body: some View {
        ZStack {
            Colors.darkGrayCustom.swiftUIColor
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 90) {
                    HStack {
                        Text("Cześć, \nPowitanie!")
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.bold.swiftUIFont(size: 20))
                        Spacer()
                    }
                    
                    VStack(spacing: 45) {
                        InputField(title: "Nicnemus",
                                   tintColor: .white, 
                                   text: $viewModel.nickname)
                        .onChange(of: viewModel.nickname) { _ in
                            viewModel.validateFields()
                        }
                        
                        InputField(title: "Hobby",
                                   tintColor: .white,
                                   text: $viewModel.hobby)
                        .onChange(of: viewModel.hobby) { _ in
                            viewModel.validateFields()
                        }
                    }
                    
                    NextButtonView(title: "Wejść") {
                        viewModel.safeUser {
                            DispatchQueue.main.async {
                                withAnimation {
                                    rootViewModel.setFlow(.main)
                                }
                            }
                        }
                    }
                    .frame(height: 52)
                    .opacity(viewModel.isValidFields ? 1 : 0.6)
                    .disabled(!viewModel.isValidFields)
                }
                .padding(.horizontal)
            }
            .scrollIndicators(.never)
            .hideKeyboardWhenTappedAround()
        }
    }
}

#Preview {
    LoginView()
}
