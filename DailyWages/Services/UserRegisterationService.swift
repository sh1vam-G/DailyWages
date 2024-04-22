//
//  UserRegisterationService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

typealias userRegistrationResponse = (Result<SuccessResponseType<UserRegistrationResponseModel>,ErrorType>) -> ()
class UserRegisterationService: BaseService {
    func registerUser(
        url: String,
        bodyParams: [String: String],
        headers: [String: String],
        completion: @escaping userRegistrationResponse
    ) {
        executeRequest(
            urlString: url,
            queryParams: [:],
            bodyParams: bodyParams,
            headers: headers,
            type: .post
        ) { (result: Result<UserRegistrationResponseModel?,ErrorType>) in
            switch result {
            case .success(let model):
                guard let model = model else {
                    completion(.success(.successWithoutResponse))
                    return
                }
                completion(.success(.successWithResponse(response: model)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
