//
//  UserRegistrationRepository.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

class UserRegistrationRepository {
    var userRegisterService = UserRegisterationService()
    
    func registerUser(
        bodyParams: [String: Any],
        completion: @escaping userRegistrationResponse
    ) {
        let url = "http://localhost:3000/customer"
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        userRegisterService.registerUser(
            url: url,
            bodyParams: bodyParams,
            headers: headers
        ) { result in
            switch result {
            case .success(.successWithResponse(let model)):
                completion(.success(.successWithResponse(response: model)))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
