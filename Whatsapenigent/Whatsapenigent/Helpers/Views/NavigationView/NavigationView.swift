//
//  NavigationView.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import SwiftUI

struct NavigationView: View {
    @State private var user: UserModel?
    @State private var image: Image?
    
    var action: (ViewAction) -> Void
    
    var body: some View {
        HStack {
            Button {
                action(.profile)
            } label: {
                if let image {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 41)
                } else {
                    Asset.profilePlaceholder.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 41)
                }
            }

            Spacer()
            
            VStack  {
                Text("Cześć")
                    .foregroundStyle(.white)
                    .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                
                if let name = user?.name {
                    Text(name)
                        .foregroundStyle(Colors.greenLite.swiftUIColor)
                        .font(Fonts.SFProDisplay.regular.swiftUIFont(size: 12))
                }
            }
            
            Spacer()
            
            Button {
                action(.profile)
            } label: {
                Asset.notifications.swiftUIImage
            }
        }
        .onAppear {
            Task {
                user = await getProfile()
                
                if let id = user?.id {
                    image = await getImage(for: id)
                }
            }
        }
    }
}

extension NavigationView {
    func getProfile() async -> UserModel? {
        DefaultsService.user
    }
    
    func getImage(for imageId: String) async -> Image? {
        let path = FileManagerService.Keys.image(id: imageId).path
        guard let imageData = FileManagerService().getFile(forPath: path),
              let uiImage = UIImage(data: imageData)
        else {
            return nil
        }
        return Image(uiImage: uiImage)
    }
    
    enum ViewAction {
        case profile
        case notifications
    }
}

#Preview {
    ZStack {
        Colors.darkGrayCustom.swiftUIColor
        NavigationView {_ in}
            .padding(.horizontal)
    }
}
