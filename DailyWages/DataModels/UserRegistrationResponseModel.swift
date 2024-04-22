//
//  UserRegistrationResponseModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

class UserRegistrationResponseModel: Codable {
    let id: String
    let isLogin: Bool
    
    init(
        id: String = String(),
        isLogin: Bool = false
    ) {
        self.id = id
        self.isLogin = isLogin
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.isLogin = try container.decode(Bool.self, forKey: .isLogin)
    }
}
