//
//  JobListDataModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import Foundation

class JobListDataModel: Codable {
    let id: Int?
    let code: String?
    let type: String?
    let numberOfPieces: Int?
    let timeReq: String?
    let amount: Int?
    let deliveryTime: String?
    let pickupTime: String?
    let paymentOn: String?
    let status: String?
    let workManual: String?
    let difficultyLevel: String?
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.numberOfPieces = try container.decodeIfPresent(Int.self, forKey: .numberOfPieces)
        self.timeReq = try container.decodeIfPresent(String.self, forKey: .timeReq)
        self.amount = try container.decodeIfPresent(Int.self, forKey: .amount)
        self.deliveryTime = try container.decodeIfPresent(String.self, forKey: .deliveryTime)
        self.pickupTime = try container.decodeIfPresent(String.self, forKey: .pickupTime)
        self.paymentOn = try container.decodeIfPresent(String.self, forKey: .paymentOn)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.workManual = try container.decodeIfPresent(String.self, forKey: .workManual)
        self.difficultyLevel = try container.decodeIfPresent(String.self, forKey: .difficultyLevel)
    }
}
