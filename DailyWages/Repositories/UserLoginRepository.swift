//
//  UserLoginRepository.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

typealias userLoginRepostoryResponse = (Result<SuccessResponseType<UserLoginDomainModel>, ErrorType>) -> ()
class UserLoginRepository {
    private let service = UserLoginService()
    
    func fetchUserData(
        username: String,
        password: String,
        completion: @escaping userLoginRepostoryResponse
    ) {
        var bodyParams: [String: String] = [:]
        bodyParams["username"] = username
        bodyParams["password"] = password
        service.fetchUserDetails(
            bodyParams: bodyParams
        ) { (result: Result<SuccessResponseType,ErrorType>) in
            switch result {
            case .success(.successWithResponse(let model)):
                completion(.success(.successWithResponse(response: UserLoginDomainModel.createModel(using: model))))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
