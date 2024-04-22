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
        var finalId = String()
        guard let id = UserProfileInformation.getUserDetails()?.id else {
            completion(.failure(.incorrectRequest))
            return
        }
        params["clientId"] = id
        params["jobId"] = jobId
        params["status"] = status
        service.updateJobService(
            url: url,
            queryParams: params
        ) { (result: Result<SuccessResponseType<String>, ErrorType>) in
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
