//
//  JobDescriptionViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation

class JobDescriptionViewModel {
    var job = JobListDomainModel()
    var respository: JobUpdateRepository = JobUpdateRepository()
    
    init(job: JobListDomainModel) {
        self.job = job
    }
    
    func updateJob(
        status: String,
        jobId: String,
        completion: @escaping (Result<SuccessResponseType<Bool>,ErrorType>) -> ()
    ) {
        respository.updateJobStatus(
            jobId: jobId,
            status: status
        ) { (result: Result<SuccessResponseType<String>,ErrorType>) in
            switch result {
            case .success(.successWithResponse(_)):
                completion(.success(.successWithResponse(response: true)))
            case .success(.successWithoutResponse):
                completion(.success(.successWithoutResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
