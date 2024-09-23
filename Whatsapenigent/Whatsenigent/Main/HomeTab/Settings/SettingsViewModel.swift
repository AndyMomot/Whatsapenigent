//
//  SettingsViewModel.swift
//  Whatsenigent
//
//  Created by Andrii Momot on 23.09.2024.
//

import Foundation
import UIKit.UIApplication

extension SettingsView {
    final class SettingsViewModel: ObservableObject {
        @Published var isOnNotifications = false
        @Published var isSaveBattery = false
        @Published var isShareSheetPresented = false
        
        let appURL = URL(string: "https://www.apple.com")
        
        func updateToggles() {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                NotificationManager().checkPermission { [weak self] status in
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        self.isOnNotifications = status == .authorized
                    }
                }
                self.isSaveBattery = DefaultsService.saveBattery
            }
        }
        
        func requestNotificationPermission() {
            NotificationManager.shared.requestPermission { result in
                switch result {
                case .success(let isGranted):
                    DispatchQueue.main.async { [weak self] in
                        guard let self else { return }
                        self.updateToggles()
                    }
                    
                    if !isGranted {
                        DispatchQueue.main.async { [weak self] in
                            guard let self else { return }
                            self.openNotificationSettings()
                        }
                    }
                    
                case .failure(let error):
                    print("Ошибка при запросе разрешения на уведомления: \(error)")
                }
            }
        }
        
        func openNotificationSettings() {
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                if UIApplication.shared.canOpenURL(appSettings) {
                    UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
                }
            }
        }
        
        func setBatterySavingMode(isOn: Bool) {
            UIScreen.main.brightness = isOn ? 0.5 : 1
            UIScreen.main.wantsSoftwareDimming = isOn ? true : false
        }
    }
}

extension SettingsView {
    enum Item {
        case notifications(isOn: Bool)
        case rateUs
        case saveEnergy(isOn: Bool)
        case shareUs
        
        var imageName: String {
            switch self {
            case .notifications:
                return Asset.notificationsBtn.name
            case .rateUs:
                return Asset.feedBack.name
            case .saveEnergy:
                return Asset.saveBattery.name
            case .shareUs:
                return Asset.shareUs.name
            }
        }
        
        var title: String {
            switch self {
            case .notifications:
                return "Włącz powiadomienia"
            case .rateUs:
                return "Oceń aplikację"
            case .saveEnergy:
                return "Oszczędzanie baterii"
            case .shareUs:
                return "Powiedz znajomym"
            }
        }
        
        var type: ItemType {
            switch self {
            case .notifications(let isOn), .saveEnergy(let isOn):
                return .toggle(isOn: isOn)
            case .rateUs, .shareUs:
                return .lick
            }
        }
    }
    
    enum ItemType {
        case toggle(isOn: Bool)
        case lick
    }
}
