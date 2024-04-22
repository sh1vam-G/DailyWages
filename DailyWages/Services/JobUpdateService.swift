//
//  JobUpdateService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

typealias jobUpdateResponse = (Result<SuccessResponseType<Bool>, ErrorType>) -> ()

class JobUpdateService: BaseService {
    func updateJobService(
        url: String,
        bodyParams: [String: String],
        queryParams: [String: String],
        completion: @escaping jobUpdateResponse
    ) {
        executeRequest(
            urlString: url,
            queryParams: queryParams,
            bodyParams: bodyParams,
            headers: ["Content-Type":"application/json"],
            type: .put
        ){ (result: Result<UpdateJobResponseModel?,ErrorType>) in
            switch result {
            case .success(let val):
                if let val = val {
                    completion(.success(.successWithResponse(response: val.status)))
                } else {
                    completion(.success(.successWithoutResponse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
