//
//  JobDescriptionView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol JobAcceptanceDelegate: AnyObject {
    func jobCancelled(jobId: Int)
    func jobAccepted(jobId: Int)
    func cancelButtonTapped()
}
struct JobDescriptionView: View {
    
    weak var delegate: JobAcceptanceDelegate?
    var jobs: JobListDomainModel = JobListDomainModel()
    private var status: String
    
    init(jobs: JobListDomainModel, delegate: JobAcceptanceDelegate?, status: String) {
        self.delegate = delegate
        self.jobs = jobs
        self.status = status
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading) {
                    if let id = jobs.id {
                        jobDescriptionCell(type: "Job id: ", value: String(id))
                    }
                    jobDescriptionCell(type: "type: ", value: jobs.type ?? String())
                    jobDescriptionCell(type: "number of pieces:", value: String(jobs.numberOfPieces ?? .zero))
                    jobDescriptionCell(type: "final Amount: ", value: "₹" + String(jobs.amount ?? .zero))
                    jobDescriptionCell(type: "time given:", value: jobs.timeReq ?? String())
                    jobDescriptionCell(type: "delivery time: ", value: jobs.deliveryTime ?? String())
                    jobDescriptionCell(type: "Pickup time: ", value: jobs.pickupTime ?? String())
                    jobDescriptionCell(type: "payment on: ", value: jobs.paymentOn ?? String())
                    jobDescriptionCell(type: "status", value: jobs.status ?? "UNASSIGNED")
                    Text("How you can do it: ")
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .font(Font.custom("", size: 25))
                    Text( jobs.workManual ?? "work manual not available")
                        .padding(20)
                }
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(20)
            .padding(.bottom, 90)
            
            HStack {
                if(self.status == "UNASSIGNED") {
                    Button("Accept") {
//                        status = "PROGRESS"
                        delegate?.jobAccepted(jobId: jobs.id ?? .zero)
                    }
                    .frame(width: 80)
                    .padding(20)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Spacer()
                        .frame(width: 50)
                }
                if(self.status == "PROGRESS") {
                    Button("Cancel") {
//                        status = "PROGRESS"
                        delegate?.jobCancelled(jobId: jobs.id ?? .zero)
                    }
                    .frame(width: 80)
                    .padding(20)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    Spacer()
                        .frame(width: 50)
                }
                
                Button("Back") {
                    delegate?.cancelButtonTapped()
                }
                .frame(width: 80)
                .padding(20)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
        }
    }
}

func jobDescriptionCell(type: String, value: String) -> some View {
    return HStack {
        Text(type)
            .padding(15)
            .font(Font.custom("", size: 20))
            .frame(width: 180, alignment: .leading)
            
        Text(value)
            .padding(10)
            .font(Font.custom("", size: 20))
    }
}

#Preview {
    JobDescriptionView(jobs: JobListDomainModel(),delegate: nil, status: "UNASSIGNED")
}
