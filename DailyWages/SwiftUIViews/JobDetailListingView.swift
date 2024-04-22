//
//  JobDetailListingView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol JobDetailListingProtocol: AnyObject {
    func jobSelected(job: JobListDomainModel)
}
struct JobDetailListingView: View {
    weak var delegate: JobDetailListingProtocol?
    var jobs: [JobListDomainModel] = []
    
    init(
        jobs: [JobListDomainModel],
        delegate: JobDetailListingProtocol?
    ) {
        self.jobs = jobs
        self.delegate = delegate
    }
    var body: some View {
        VStack {
            ScrollView {
                ForEach(jobs, id: \.self) { job in
                    Spacer()
                        .frame(height: 20)
                    JobDetailListingCellView(job: job)
                        .shadow(color:.gray ,radius: 4,x: 0,y: 4)
                        .onTapGesture {
                            delegate?.jobSelected(job: job)
                        }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: UIColor(hex: "#eeeeee")))
    }
}

#Preview {
    JobDetailListingView(jobs: [], delegate: nil)
}
