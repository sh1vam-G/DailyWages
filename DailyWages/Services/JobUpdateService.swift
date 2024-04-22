//
//  JobUpdateService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

typealias jobUpdateResponse = (Result<SuccessResponseType<String>, ErrorType>) -> ()

class JobUpdateService: BaseService {
    func updateJobService(
        url: String,
        queryParams: [String: String],
        completion: @escaping jobUpdateResponse
    ) {
        executeRequest(
            urlString: url,
            queryParams: queryParams,
            bodyParams: [:],
            headers: [:],
            type: .put
        ){ (result: Result<String?,ErrorType>) in
            switch result {
            case .success(let val):
                if let val = val, val == "UPDATED SUCCESSFULLY" {
                    completion(.success(.successWithResponse(response: val)))
                } else {
                    completion(.success(.successWithoutResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
