//
//  JobListRepository.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit

typealias JobListDomainResponse = (Result<SuccessResponseType<[JobListDomainModel]>, ErrorType>) -> ()

class JobListRepository {
    let serivce = JobListService()
    func fetchJobLists(completion: @escaping JobListDomainResponse) {
        serivce.fetchJobLists { (result: Result<SuccessResponseType, ErrorType>) in
            switch result {
            case .success(.successWithResponse(let response)):
                let model = JobListDomainModel.prepareModel(using: response)
                completion(.success(.successWithResponse(response: model)))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
