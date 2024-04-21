//
//  UserLoginDomainModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

class UserLoginInfoModel {
    let id: String
    let username: String
    let password: String
    
    init(id: String, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
