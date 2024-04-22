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
                    .foregroundColor(.black)
                    .font(Font.custom("", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
                Spacer()
                Text("details:")
                    .foregroundColor(.black)
                    .font(Font.custom("", size: 24))
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
            }
            
            HStack {
                Text("number of pieces: ")
                    .foregroundColor(.black)
                    .padding(15)
                    .padding(.horizontal, 15)
                Spacer()
                Text(String(job.numberOfPieces ?? .zero))
                    .foregroundColor(.black)
                    .font(Font.custom("", size: 20))
                    .padding(.horizontal, 30)
            }.padding(.top, -12)
            HStack {
                Text("status: ")
                    .foregroundColor(.black)
                    .padding(15)
                    .padding(.horizontal, 15)
                Spacer()
                Text(String(job.status ?? "Unknown"))
                    .foregroundColor(.black)
                    .font(Font.custom("", size: 20))
                    .padding(.horizontal, 30)
            }.padding(.top, -22)
            HStack {
                Text("total amount:")
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                Spacer()
                Text("₹" + String(job.amount ?? .zero))
                    .foregroundColor(.black)
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
