//
//  JobDetailListingCellView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

struct JobDetailListingCellView: View {
    var job: JobListDomainModel
    var body: some View {
        VStack {
            HStack {
                Text("Job:")
                    .font(Font.custom("", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                Spacer()
                Text("details:")
                    .font(Font.custom("", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
            }
            HStack {
                Text("number of pieces: ")
                    .padding(15)
                    .padding(.horizontal, 15)
                Spacer()
                Text(String(job.numberOfPieces ?? .zero))
                    .font(Font.custom("", size: 20))
                    .padding(.horizontal, 30)
            }.padding(.top, -12)
            HStack {
                Text("total amount:")
                    .padding(.horizontal, 30)
                Spacer()
                Text("₹" + String(job.amount ?? .zero))
                    .font(Font.custom("", size: 20))
                    .padding(.horizontal, 30)
            }.padding(.top, -15)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 40, height: 140)
        .background(Color.white)
        .cornerRadius(20)
    }
}

#Preview {
    JobDetailListingCellView(job: JobListDomainModel())
}
