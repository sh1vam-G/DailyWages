//
//  JobListService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit

typealias JobListApiResponse = (Result<SuccessResponseType<[JobListDataModel]>, ErrorType>)-> ()

enum SuccessResponseType<T> {
    case successWithResponse(response: T)
    case successWithoutResponse
}

class JobListService: BaseService {
    
    func fetchJobLists(
        completion: @escaping JobListApiResponse
    ) {
        let jobListUrl = "localhost:3000/jobs"
        
        executeRequest(
            urlString: jobListUrl,
            queryParams: [:],
            bodyParams: [:],
            headers: [:],
            type: .get
        ) { (result: Result<[JobListDataModel]?, ErrorType>) in
            switch result {
            case .success(let data):
                guard let response = data else {
                    completion(.success(.successWithoutResponse))
                    return
                }
                completion(.success(.successWithResponse(response: response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
