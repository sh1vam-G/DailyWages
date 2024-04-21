//
//  JobDetailListingViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit

class JobDetailListingViewModel {
    
    var jobs: [JobListDomainModel] = []
    var repository: JobListRepository = JobListRepository()
    var type: HomeJobTypes
    
    init(type: HomeJobTypes) {
        self.type = type
    }
    
    func prepareJobsList(completion: @escaping (Result<Bool,ErrorType>) -> ()) {
        repository.fetchJobLists { response in
            switch response {
            case .success(.successWithResponse(let result)):
                self.jobs = result
                self.filterJobsList()
                completion(.success(true))
            case .success(.successWithoutResponse):
                completion(.success(false))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
    
    func filterJobsList() {
        jobs = jobs.filter { $0.status == "UNASSIGNED" }
    }
    
    func getJobAsPerType() -> [JobListDomainModel] {
        return jobs.filter { $0.type == type.rawValue}
    }
}
