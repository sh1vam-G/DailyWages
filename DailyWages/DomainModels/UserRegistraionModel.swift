//
//  UserRegistraionModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

class UserRegistraionModel: ObservableObject {
    @Published var name: String
    @Published var gender: String
    @Published var email: String
    @Published var dateOfBirth: Date
    @Published var phoneNumber: String
    @Published var ratings: Int
    @Published var username: String
    @Published var pass: String
    @Published var latitude: Double
    @Published var longitude: Double
    @Published var houseNo: String
    @Published var apartment: String
    @Published var city: String
    @Published var state: String
    @Published var pincode: String
    
    init(
        name: String = String(),
        gender: String = String(),
        email: String = String(),
        dateOfBirth: Date = Date(),
        phoneNumber: String = String(),
        ratings: Int = .zero,
        username: String = String(),
        pass: String = String(),
        latitude: Double = Double(),
        longitude: Double = Double(),
        houseNo: String = String(),
        apartment: String = String(),
        city: String = String(),
        state: String = String(),
        pincode: String = String()
    ) {
        self.name = name
        self.gender = gender
        self.email = email
        self.dateOfBirth = dateOfBirth
        self.phoneNumber = phoneNumber
        self.ratings = ratings
        self.username = username
        self.pass = pass
        self.latitude = latitude
        self.longitude = longitude
        self.houseNo = houseNo
        self.apartment = apartment
        self.city = city
        self.state = state
        self.pincode = pincode
    }
}
