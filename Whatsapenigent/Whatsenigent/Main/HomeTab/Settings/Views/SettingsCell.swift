//
//  SettingsCell.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct SettingsCell: View {
    var item: SettingsView.Item
    @State private var isOn = false
    
    var action: (Bool?) -> Void
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        VStack(spacing: 15) {
            HStack(spacing: 15) {
                ZStack {
                    Circle()
                        .foregroundStyle(Colors.greenLite.swiftUIColor)
                        .frame(width: bounds.width * 0.09)
                    
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: bounds.width * 0.055)
                }
                
                Text(item.title)
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                
                Spacer()
                
                switch item.type {
                case .toggle:
                    Toggle("", isOn: $isOn)
                case .lick:
                    Button {
                        action(nil)
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 20))
                    }
                }
            }
            
            GreenDivider()
        }
        .onAppear {
            switch item.type {
            case .toggle(let isOn):
                withAnimation {
                    self.isOn = isOn
                }
            case .lick:
                break
            }
        }
        .onChange(of: isOn) { value in
            action(isOn)
        }
    }
}

#Preview {
    VStack(spacing: 60) {
        SettingsCell(item: .notifications(isOn: false)) { _ in }
        SettingsCell(item: .rateUs) { _ in }
    }
    .padding(.horizontal)
}
