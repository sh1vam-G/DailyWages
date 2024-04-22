//
//  UserNameService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

typealias userNameResponse = (Result<SuccessResponseType<Bool>,ErrorType>) -> ()

class UserNameService: BaseService {
    
    func isUserNameAvailable(
        url: String,
        bodyParams: [String: Any],
        completion: @escaping userNameResponse
    ) {
        
        executeRequest(
            urlString: url,
            queryParams: [:],
            bodyParams: bodyParams,
            headers: ["Content-Type":"application/json"],
            type: .post
        ) { (result: Result<Bool?, ErrorType>) in
            switch result {
            case .success(let isValid):
                guard let isValid = isValid else {
                    completion(.success(.successWithoutResponse))
                    return
                }
                if isValid {
                    completion(.success(.successWithResponse(response: true)))
                } else {
                    completion(.success(.successWithResponse(response: false)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
