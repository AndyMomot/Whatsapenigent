//
//  OnboardingView.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.darkGreen.swiftUIColor
                .ignoresSafeArea()
            
            VStack {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .ignoresSafeArea(edges: .top)
            
            VStack {
                Spacer(minLength: bounds.height / 2)
                
                Text(item.text)
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.semibold.swiftUIFont(size: 16))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack(spacing: 30) {
                    NextButtonView(title: item.nextTitle) {
                        switch item {
                        case .first, .second:
                            withAnimation {
                                currentPageIndex = item.next.rawValue
                            }
                        case .third:
                            showLogin()
                        }
                    }
                    .frame(height: bounds.height * 0.086)
                    
                    switch item {
                    case .first, .second:
                        Button {
                            showLogin()
                        } label: {
                            Text("Pominąć")
                                .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                                .multilineTextAlignment(.center)
                        }
                    case .third:
                        Button {
                            viewModel.showPrivacyPolicy.toggle()
                        } label: {
                            // Zgadzam się z polityką prywatności
                            Text("Zgadzam się z")
                                .foregroundColor(.white)
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14)) +
                            Text(" polityką prywatności")
                                .foregroundColor(Colors.greenCustom.swiftUIColor)
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 14))
                                .underline()
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            SwiftUIViewWebView(url: viewModel.ppUrl)
        }
    }
}

private extension OnboardingView {
    func showLogin() {
        withAnimation {
            rootViewModel.setFlow(.login)
        }
    }
}

#Preview {
    OnboardingView(item: .third, currentPageIndex: .constant(0))
}
