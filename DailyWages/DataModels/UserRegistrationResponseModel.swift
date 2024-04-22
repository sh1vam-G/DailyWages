//
//  UserRegistrationResponseModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

class UserRegistrationResponseModel: Codable {
    let id: Int
    let login: Bool
    
    init(
        id: Int = .zero,
        login: Bool = false
    ) {
        self.id = id
        self.login = login
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.login = try container.decode(Bool.self, forKey: .login)
    }
}
