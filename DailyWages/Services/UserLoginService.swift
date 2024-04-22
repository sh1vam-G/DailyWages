//
//  UserLoginService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

typealias userLoginResponse = (Result<SuccessResponseType<UserLoginResponseModel>, ErrorType>) -> ()

class UserLoginService: BaseService {
    func fetchUserDetails(
        bodyParams: [String: Any],
        completion: @escaping userLoginResponse
    ) {
        let urlString = "http://localhost:3000/client"
        var headers: [String: String] = [:]
        headers["Content-Type"] = "application/json"
        executeRequest(
            urlString: urlString,
            queryParams: [:],
            bodyParams: bodyParams,
            headers: headers,
            type: .post
        ) { (result: Result<UserLoginResponseModel?, ErrorType>) in
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.success(.successWithoutResponse))
                    return
                }
                completion(.success(.successWithResponse(response: data)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
