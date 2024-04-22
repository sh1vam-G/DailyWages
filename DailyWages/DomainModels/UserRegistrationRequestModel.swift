//
//  UserRegistrationRequestModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import UIKit

class UserRegistrationRequestModel {
    var name: String
    var gender: String
    var email: String
    var dateOfBirth: Date
    var phoneNumber: String
    var ratings: Int
    var username: String
    var pass: String
    var address: UserAddressDomainModel
    
    init(
        name: String,
        gender: String,
        email: String,
        dateOfBirth: Date,
        phoneNumber: String,
        ratings: Int,
        username: String,
        pass: String,
        address: UserAddressDomainModel
    ) {
        self.name = name
        self.gender = gender
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        self.ratings = ratings
        self.username = username
        self.pass = pass
        self.address = address
    }
    
    static func createModel(using model: UserRegistrationModel) -> UserRegistrationRequestModel {
        return UserRegistrationRequestModel(
            name: model.name,
            gender: model.gender,
            email: model.email,
            dateOfBirth: model.dateOfBirth,
            phoneNumber: model.phoneNumber,
            ratings: model.ratings,
            username: model.username,
            pass: model.pass,
            address: UserAddressDomainModel(
                latitude: model.latitude,
                longitude: model.longitude,
                houseNo: model.houseNo,
                apartment: model.apartment,
                city: model.city,
                state: model.state,
                pincode: model.pincode
            )
        )
    }
    
    func covertIntoBodyParams() -> [String: String] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        var bodyParams: [String: String] = [:]
        bodyParams["name"] = self.name
        bodyParams["gender"] = self.gender
        bodyParams["email"] = self.email
        bodyParams["dateOfBirth"] = dateFormatter.string(from: self.dateOfBirth)
        bodyParams["phoneNumber"] = self.phoneNumber
        bodyParams["ratings"] = String(self.ratings)
        bodyParams["username"] = self.username
        bodyParams["pass"] = self.pass
        return bodyParams
    }
}
