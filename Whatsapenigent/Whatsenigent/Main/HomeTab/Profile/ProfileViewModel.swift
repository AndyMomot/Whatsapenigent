//
//  ProfileViewModel.swift
//  Whatsapenigent
//
//  Created by Andrii Momot on 22.09.2024.
//

import Foundation
import UIKit.UIImage

extension ProfileView {
    final class ProfileViewModel: ObservableObject {
        @Published var image: UIImage = UIImage()
        @Published var name: String = ""
        @Published var hobby: String = ""
        
        @Published var showImagePicker = false
        @Published var canEdit = false
        @Published var showSettings = false
        
        var isValidFields: Bool {
            return !name.isEmpty && !hobby.isEmpty
        }
        
        func getUser() async {
            guard let user = DefaultsService.user else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                self.name = user.name
                self.hobby = user.hobby
                
                Task {
                    if let image = await self.getImage(for: user.id) {
                        self.image = image
                    }
                }
            }
        }
        
        func updateUser() async {
            guard isValidFields else { return }
            DefaultsService.user?.name = self.name
            DefaultsService.user?.hobby = self.hobby
            
            if let id =  DefaultsService.user?.id {
                await saveImage(image: self.image, to: id)
            }
        }
    }
}

private extension ProfileView.ProfileViewModel {
    func getImage(for imageId: String) async -> UIImage? {
        let path = FileManagerService.Keys.image(id: imageId).path
        guard let imageData = FileManagerService().getFile(forPath: path),
              let uiImage = UIImage(data: imageData)
        else {
            return nil
        }
        return uiImage
    }
    
    func saveImage(image: UIImage, to pathID: String) async {
        guard image != .init(), let data = image.jpegData(compressionQuality: 1) else { return }
        let path = FileManagerService.Keys.image(id: pathID).path
        FileManagerService().saveFile(data: data, forPath: path)
    }
}
