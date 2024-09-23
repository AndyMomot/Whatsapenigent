//
//  ProfileView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var viewModel = ProfileViewModel()
    @Environment(\.dismiss) private var dismiss
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.darkGrayCustom.swiftUIColor
                .ignoresSafeArea()
            
            VStack {
                if viewModel.image != .init() {
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: bounds.width,
                               height: bounds.height / 2)
                } else {
                    Asset.profilePlaceholder.swiftUIImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: bounds.width,
                               height: bounds.height / 2)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 25))
                    }
                    
                    Spacer()
                    
                    Text("Twój profil")
                        .foregroundStyle(.white)
                        .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 16))
                    
                    Spacer()
                    
                    Button {
                        viewModel.showSettings.toggle()
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.white)
                            .font(Fonts.SFProDisplay.medium.swiftUIFont(size: 35))
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .shadow(color: .black.opacity(0.5), radius: 10)
            
            VStack(spacing: bounds.height * 0.04) {
                HStack {
                    Spacer()
                    
                    Button {
                        viewModel.showImagePicker.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(Colors.greenLite.swiftUIColor.opacity(viewModel.canEdit ? 1 : 0.3))
                                .frame(width: bounds.width * 0.11)
                            
                            Asset.camera.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: bounds.width * 0.065)
                        }
                    }
                    .disabled(!viewModel.canEdit)
                }
                
                VStack(spacing: 15) {
                    GreenDivider()
                        .padding(.top, bounds.height * 0.07)
                    
                    HStack(spacing: 15) {
                        Circle()
                            .foregroundStyle(Colors.greenLite.swiftUIColor)
                            .frame(width: bounds.width * 0.09)
                        
                        TextField(text: $viewModel.name) {
                            Text("Nicnemus")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor.opacity(0.3))
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
                        }
                        .foregroundStyle(Colors.blackCustom.swiftUIColor.opacity(viewModel.canEdit ? 1 : 0.3))
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
                        .disabled(!viewModel.canEdit)
                    }
                    
                    GreenDivider()
                    
                    HStack(spacing: 15) {
                        Circle()
                            .foregroundStyle(Colors.greenLite.swiftUIColor)
                            .frame(width: bounds.width * 0.09)
                        
                        TextField(text: $viewModel.hobby) {
                            Text("Hobby")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor.opacity(0.3))
                                .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
                        }
                        .foregroundStyle(Colors.blackCustom.swiftUIColor.opacity(viewModel.canEdit ? 1 : 0.3))
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 20))
                        .disabled(!viewModel.canEdit)
                    }
                    
                    GreenDivider()
                    
                    Button {
                        withAnimation {
                            viewModel.canEdit.toggle()
                            if !viewModel.canEdit {
                                Task {
                                    await viewModel.updateUser()
                                }
                            }
                        }
                    } label: {
                        HStack(spacing: 15) {
                            Text("Edytuj profil")
                            Image(systemName: "pencil")
                        }
                        .foregroundStyle(
                            viewModel.canEdit ? Colors.greenCustom.swiftUIColor : Colors.blackCustom.swiftUIColor
                        )
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                    }
                    .padding(.top, bounds.height * 0.035)
                    .padding(.bottom)
                }
                .padding(.horizontal, 26)
                .background(.white)
                .cornerRadius(48, corners: .allCorners)
                .shadow(color: .black.opacity(0.1), radius: 10)
            }
            .padding(.horizontal)
        }
        .hideKeyboardWhenTappedAround()
        .onAppear {
            Task {
                await viewModel.getUser()
            }
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.image)
        }
        .navigationDestination(isPresented: $viewModel.showSettings) {
            SettingsView()
        }
    }
}

#Preview {
    ProfileView()
}
