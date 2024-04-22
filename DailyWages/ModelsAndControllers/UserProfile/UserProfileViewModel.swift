//
//  UserProfileViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

class UserProfileViewModel {
    var userProfileData: UserLoginDomainModel = UserLoginDomainModel()
    
    init(userData: UserLoginDomainModel) {
        userProfileData = userData
    }
}
