//
//  UserLoginResponseModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit

class UserLoginResponseModel: Codable {
    let id: Int
    let name: String
    let gender: String
    let email: String
    let phoneNumber: String
    let ratings: Int
    let address: UserAddress
    let jobs: [JobListDataModel]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.email = try container.decode(String.self, forKey: .email)
        self.phoneNumber = try container.decode(String.self, forKey: .phoneNumber)
        self.ratings = try container.decode(Int.self, forKey: .ratings)
        self.address = try container.decode(UserAddress.self, forKey: .address)
        self.jobs = try container.decode([JobListDataModel].self, forKey: .jobs)
    }
}
    
class UserAddress: Codable {
    let id: Int
    let latitude: Double
    let longitude: Double
    let houseNo: String
    let apartment: String
    let city: String
    let state: String
    let pincode: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.latitude = try container.decode(Double.self, forKey: .latitude)
        self.longitude = try container.decode(Double.self, forKey: .longitude)
        self.houseNo = try container.decode(String.self, forKey: .houseNo)
        self.apartment = try container.decode(String.self, forKey: .apartment)
        self.city = try container.decode(String.self, forKey: .city)
        self.state = try container.decode(String.self, forKey: .state)
        self.pincode = try container.decode(String.self, forKey: .pincode)
    }
}

