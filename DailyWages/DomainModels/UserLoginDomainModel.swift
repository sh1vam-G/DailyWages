//
//  UserLoginResponseDomainModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

struct UserLoginDomainModel {
    let id: Int
    let name: String
    let gender: String
    let email: String
    let phoneNumber: String
    let ratings: Int
    let address: UserAddressDomainModel
    let jobs: [JobListDomainModel]
    
    init(
        id: Int = .zero,
        name: String = String(),
        gender: String = String(),
        email: String = String(),
        phoneNumber: String = String(),
        ratings: Int = .zero,
        address: UserAddressDomainModel = UserAddressDomainModel(),
        jobs: [JobListDomainModel] = []
    ) {
        self.id = id
        self.name = name
        self.gender = gender
        self.email = email
        self.phoneNumber = phoneNumber
        self.ratings = ratings
        self.address = address
        self.jobs = jobs
    }
    
    static func createModel(using model: UserLoginResponseModel) -> UserLoginDomainModel {
        return UserLoginDomainModel(
            id: model.id,
            name: model.name,
            gender: model.gender,
            email: model.email,
            phoneNumber: model.phoneNumber,
            ratings: model.ratings,
            address: UserAddressDomainModel.getAddress(using: model.address),
            jobs: JobListDomainModel.prepareModel(using: model.jobs)
        )
    }
    func getInProgressJobs() -> [JobListDomainModel] {
        return jobs.filter{ $0.status == "PROGRESS" }
    }
    
    func getUnassignedJobs() -> [JobListDomainModel] {
        return jobs.filter{ $0.status == "UNASSIGNED" }
    }
    
    func getCompletedJobs() -> [JobListDomainModel] {
        return jobs.filter{ $0.status == "COMPLETED" }
    }
}

struct UserAddressDomainModel {
    let id: Int
    let latitude: Double
    let longitude: Double
    let houseNo: String
    let apartment: String
    let city: String
    let state: String
    let pincode: String
    
    init(
        id: Int = .zero,
        latitude: Double = Double(),
        longitude: Double = Double(),
        houseNo: String = String(),
        apartment: String = String(),
        city: String = String(),
        state: String = String(),
        pincode: String = String()
    ) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.houseNo = houseNo
        self.apartment = apartment
        self.city = city
        self.state = state
        self.pincode = pincode
    }
    
    static func getAddress(using model: UserAddress) -> UserAddressDomainModel {
        return UserAddressDomainModel(
            id: model.id,
            latitude: model.latitude,
            longitude: model.longitude,
            houseNo: model.houseNo,
            apartment: model.apartment,
            city: model.city,
            state: model.state,
            pincode: model.pincode
        )
    }
    
    static func createBodyParams(address: UserAddressDomainModel) -> [String: Any] {
        var bodyParams: [String: Any] = [:]
        bodyParams["latitude"] = address.latitude
        bodyParams["longitude"] = address.longitude
        bodyParams["houseNo"] = address.houseNo
        bodyParams["apartment"] = address.apartment
        bodyParams["city"] = address.city
        bodyParams["state"] = address.state
        bodyParams["pincode"] = address.pincode
        return bodyParams
    }
    
    func getUserAddress() -> String {
        return (self.houseNo + ", " + self.apartment + ", " + self.city + ", " + self.state + ", " + self.pincode)
    }
}
