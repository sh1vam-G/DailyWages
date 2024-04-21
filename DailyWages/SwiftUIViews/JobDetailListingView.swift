//
//  JobDetailListingView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

struct JobDetailListingView: View {
    var jobs: [JobListDomainModel] = []
    var body: some View {
        VStack {
            ScrollView {
                ForEach(jobs, id: \.self) { job in
                    Spacer()
                        .frame(height: 20)
                    JobDetailListingCellView(job: job)
                        .shadow(color:.gray ,radius: 4,x: 0,y: 4)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: UIColor(hex: "#eeeeee")))
    }
}

#Preview {
    JobDetailListingView(jobs: [])
}
