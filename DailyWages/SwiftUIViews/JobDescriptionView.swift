//
//  JobDescriptionView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol JobAcceptanceDelegate: AnyObject {
    func jobAccepted()
    func cancelButtonTapped()
}
struct JobDescriptionView: View {
    
    weak var delegate: JobAcceptanceDelegate?
    
    init(delegate: JobAcceptanceDelegate?) {
        self.delegate = delegate
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading) {
                    jobDescriptionCell(type: "Job id: ", value: "id")
                    jobDescriptionCell(type: "type: ", value: "Packaging")
                    jobDescriptionCell(type: "number of pieces:", value: "3")
                    jobDescriptionCell(type: "final Amount: ", value: "₹" + "2000")
                    jobDescriptionCell(type: "time given:", value: "8 hrs")
                    jobDescriptionCell(type: "delivery time: ", value: "2024-04-16")
                    jobDescriptionCell(type: "Pickup time: ", value: "2024-04-17")
                    jobDescriptionCell(type: "payment on: ", value: "PICKUP")
                    jobDescriptionCell(type: "status", value: "UNASSIGNED")
                    Text("How you can do it: ")
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                        .font(Font.custom("", size: 25))
                    Text("Following steps need to be followed:\n\n1. open the packing paper and spread it on a clean surface.\n\n2.Place the object to pack on the packing paper.\n\n3.Fold the packing paper as per the marking instructions")
                        .padding(20)
                }
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(20)
            .padding(.bottom, 90)
            
            HStack {
                Button("Accept") {
                    delegate?.jobAccepted()
                }
                .frame(width: 80)
                .padding(20)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(20)
            
                Spacer()
                    .frame(width: 50)
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
            
//        Spacer()
        Text(value)
            .padding(10)
            .font(Font.custom("", size: 20))
    }
}

#Preview {
    JobDescriptionView(delegate: nil)
}
