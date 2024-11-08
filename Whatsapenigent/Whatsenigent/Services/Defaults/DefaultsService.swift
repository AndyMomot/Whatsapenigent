//
//  DefaultsService.swift
//
//  Created by Andrii Momot on 16.04.2024.
//

import Foundation

final class DefaultsService {
    static let standard = UserDefaults.standard
    private init() {}
}

extension DefaultsService {
    static var flow: RootContentView.ViewState {
        get {
            let name = standard.string(forKey: Keys.flow.rawValue) ?? ""
            return RootContentView.ViewState(rawValue: name) ?? .onboarding
        }
        set {
            standard.set(newValue.rawValue, forKey: Keys.flow.rawValue)
        }
    }
    
    static var user: UserModel? {
        get {
            if let data = standard.object(forKey: Keys.user.rawValue) as? Data {
                let user = try? JSONDecoder().decode(UserModel.self, from: data)
                return user
            }
            return nil
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.setValue(data, forKey: Keys.user.rawValue)
            }
        }
    }
    
    static var saveBattery: Bool {
        get {
            standard.bool(forKey: Keys.saveBattery.rawValue)
        }
        set {
            standard.setValue(newValue, forKey: Keys.saveBattery.rawValue)
        }
    }
    
    static var employeeCosts: [EmployeeCostsModel] {
        get {
            if let data = standard.object(forKey: Keys.employeeCosts.rawValue) as? Data {
                let items = try? JSONDecoder().decode([EmployeeCostsModel].self, from: data)
                return items ?? []
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                standard.setValue(data, forKey: Keys.employeeCosts.rawValue)
            }
        }
    }
    
    static var awardIndex: Int? {
        get {
            standard.integer(forKey: Keys.awardIndex.rawValue)
        }
        set {
            standard.setValue(newValue, forKey: Keys.awardIndex.rawValue)
        }
    }
}

extension DefaultsService {
    static func removeAll() {
        if let bundleIdentifier = Bundle.main.bundleIdentifier {
            standard.removePersistentDomain(forName: bundleIdentifier)
        }
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case flow
        case user
        case saveBattery
        case employeeCosts
        case awardIndex
    }
}
