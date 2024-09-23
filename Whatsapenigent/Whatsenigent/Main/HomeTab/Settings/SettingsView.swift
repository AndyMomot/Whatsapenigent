//
//  SettingsView.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Asset.preloaderBg.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                HStack {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                    }
                    
                    Spacer()
                    
                    Text("Ustawienia")
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 17))
                    
                    Spacer()
                    
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                        .hidden()
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 15) {
                        if viewModel.isOnNotifications {
                            SettingsCell(item: .notifications(isOn: viewModel.isOnNotifications)) { _ in
                                DispatchQueue.main.async {
                                    viewModel.requestNotificationPermission()
                                }
                            }
                        } else {
                            SettingsCell(item: .notifications(isOn: viewModel.isOnNotifications)) { isOn in
                                DispatchQueue.main.async {
                                    viewModel.requestNotificationPermission()
                                }
                            }
                        }
                        
                        SettingsCell(item: .rateUs) { _ in
                            if let url = viewModel.appURL {
                                UIApplication.shared.open(url)
                            }
                        }
                        
                        if viewModel.isSaveBattery {
                            SettingsCell(item: .saveEnergy(isOn: viewModel.isSaveBattery)) { isOn in
                                let isOn = isOn ?? false
                                DispatchQueue.main.async {
                                    DefaultsService.saveBattery = isOn
                                    viewModel.setBatterySavingMode(isOn: isOn)
                                }
                            }
                        } else {
                            SettingsCell(item: .saveEnergy(isOn: viewModel.isSaveBattery)) { isOn in
                                let isOn = isOn ?? false
                                DispatchQueue.main.async {
                                    DefaultsService.saveBattery = isOn
                                    viewModel.setBatterySavingMode(isOn: isOn)
                                }
                            }
                        }
                        
                        SettingsCell(item: .shareUs) { _ in
                            viewModel.isShareSheetPresented.toggle()
                        }
                    }
                    .padding(.vertical, 54)
                    .padding(.horizontal, 26)
                    .background(.white)
                    .cornerRadius(48, corners: .allCorners)
                    .padding(.horizontal)
                }
                .scrollIndicators(.never)
            }
        }
        .onAppear {
            withAnimation {
                viewModel.updateToggles()
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $viewModel.isShareSheetPresented) {
            ShareSheet(items: [viewModel.appURL?.absoluteString ?? ""])
        }
    }
}

#Preview {
    SettingsView()
}
