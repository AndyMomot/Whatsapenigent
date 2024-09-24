//
//  PreloaderView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 21.09.2024.
//

import SwiftUI

struct PreloaderView: View {
    @StateObject private var viewModel = PreloaderViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Asset.preloaderLogo.swiftUIImage
                    .padding(.horizontal, 67)
                Spacer(minLength: bounds.height / 2)
            }
            
            VStack {
                Spacer()
                
                VStack(spacing: 13) {
                    Text("Ładowanie...")
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .font(Fonts.SFProDisplay.thinItalic.swiftUIFont(size: 16))
                    
                    CustomLoaderView {}
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
    }
}

#Preview {
    PreloaderView()
}
