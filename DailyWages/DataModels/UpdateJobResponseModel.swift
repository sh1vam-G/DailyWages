//
//  UpdateJobResponseModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation

class UpdateJobResponseModel: Codable {
    let status: Bool
    
    init(status: Bool) {
        self.status = status
    }
}
