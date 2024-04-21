//
//  UserProfileInformation.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

final class UserProfileInformation {
    
    static func saveUserDetails(user: UserLoginDomainModel) {
        UserDefaults.standard.setValue(user.id, forKey: "id")
        UserDefaults.standard.setValue(user.username, forKey: "username")
        UserDefaults.standard.setValue(user.password, forKey: "password")
    }
    
    static func getUserDetails() -> UserLoginDomainModel? {
        guard let id = UserDefaults.standard.string(forKey: "id"),
              let username = UserDefaults.standard.string(forKey: "username"),
              let password = UserDefaults.standard.string(forKey: "password")
        else { return nil }
        return UserLoginDomainModel(id: id, username: username, password: password)
    }
    
    static func clearUserDetails() {
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
    }
}
