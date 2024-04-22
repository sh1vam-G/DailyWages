//
//  JobListingDomainModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import Foundation
import SwiftUI

protocol JobListingProtocol {
    func getJobsText() -> Text
    func getJobsImage() -> Image
}

enum JobStatusType: String {
    case unassigned = "UNASSIGNED"
    case done = "DONE"
    case progress = "PROGRESS"
    
}
struct JobListDomainModel: Hashable {
    var id: Int?
    var code: String?
    var type: String?
    var numberOfPieces: Int?
    var timeReq: String?
    var amount: Int?
    var deliveryTime: String?
    var pickupTime: String?
    var paymentOn: String?
    var status: String?
    var workManual: String?
    var difficultyLevel: String?
    
    init(
        id: Int? = .zero,
        code: String? = "",
        type: String? = "",
        numberOfPieces: Int? = .zero,
        timeReq: String? = "",
        amount: Int? = .zero,
        deliveryTime: String? = "",
        pickupTime: String? = "",
        paymentOn: String? = "",
        status: String? = "",
        workManual: String? = "",
        difficultyLevel: String? = ""
    ) {
        self.id = id
        self.code = code
        self.type = type
        self.numberOfPieces = numberOfPieces
        self.timeReq = timeReq
        self.amount = amount
        self.deliveryTime = deliveryTime
        self.pickupTime = pickupTime
        self.paymentOn = paymentOn
        self.status = status
        self.workManual = workManual
        self.difficultyLevel = difficultyLevel
    }
    
    static func prepareModel(using model: [JobListDataModel]) -> [JobListDomainModel] {
        var jobs: [JobListDomainModel] = []
        jobs = model.map{job in createModel(using:job)}
        return jobs
    }
    
    static func createModel(using model: JobListDataModel) -> JobListDomainModel {
        return JobListDomainModel (
            id: model.id,
            code: model.code,
            type: model.type,
            numberOfPieces: model.numberOfPieces,
            timeReq: model.timeReq,
            amount: model.amount,
            deliveryTime: model.deliveryTime,
            pickupTime: model.pickupTime,
            paymentOn: model.paymentOn,
            status: model.status,
            workManual: model.workManual,
            difficultyLevel: model.difficultyLevel
        )
    }
}
