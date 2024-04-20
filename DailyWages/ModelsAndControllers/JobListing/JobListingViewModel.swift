//
//  JobListingViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit

class JobListingViewModel: NSObject {

    var jobs: [JobListDomainModel] = []
    var repository: JobListRepository = JobListRepository()
    var jobDomainList: Jobs = Jobs(id: UUID(), jobs: [
        .packaging,
        .stitching,
        .laundry,
        .weaver,
        .stylist,
        .designer
    ])
    
    func prepareJobsList(completion: @escaping (Result<Bool,ErrorType>) -> ()) {
        repository.fetchJobLists { response in
            switch response {
            case .success(.successWithResponse(let result)):
                self.jobs = result
                completion(.success(true))
            case .success(.successWithoutResponse):
                completion(.success(false))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
}
