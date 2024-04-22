//
//  UserNameRepository.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

class UserNameRepository {
    var userNameService = UserNameService()
    
    func isUserNameValid (
        username: String,
        completion: @escaping userNameResponse
    ) {
        let url = "http://localhost:3000/username"
        var bodyParams: [String: String] = [:]
        bodyParams["username"] = username
        userNameService.isUserNameAvailable(
            url: url,
            bodyParams: bodyParams
        ) { result in
            switch result {
            case .success(.successWithResponse(let boolVal)):
                completion(.success(.successWithResponse(response: boolVal)))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
