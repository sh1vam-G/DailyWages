//
//  JobUpdateRepository.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit

class JobUpdateRepository {
    var service = JobUpdateService()
    
    func updateJobStatus(
        jobId: String,
        status: String,
        completion: @escaping jobUpdateResponse
    ) {
        let url = "http://localhost:3000/accept"
        var params: [String: String] = [:]
        guard let details = UserProfileInformation.getUserDetails() else {
            completion(.failure(.incorrectRequest))
            return
        }
        params["clientId"] = details.id
        params["jobId"] = jobId
        params["status"] = status
        var bodyParams: [String: String] = [:]
        bodyParams["username"] = details.username
        bodyParams["password"] = details.password
        service.updateJobService(
            url: url,
            bodyParams: bodyParams,
            queryParams: params
        ) { (result: Result<SuccessResponseType<Bool>, ErrorType>) in
            switch result {
            case .success(.successWithResponse(let resp)):
                completion(.success(.successWithResponse(response: resp)))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
