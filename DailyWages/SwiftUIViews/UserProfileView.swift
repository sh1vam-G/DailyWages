//
//  UserProfileView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol userProfileProtocol: AnyObject {
    func jobSelected()
    func logoutButtonTapped()
}

struct UserProfileView: View {
    
    weak var delegate: userProfileProtocol?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hi Shivam !!!")
                        .font(Font.custom("", size: 30))
                        .padding(20)
                    userDescriptionView(type: "email: ", value: "shivam2671997@gmail.com")
                    userDescriptionView(type: "phone number: ", value: "9813179017")
                    userDescriptionView(type: "address: ", value: "106, pulikeshi apartment, Bengaluru, Karnataka")
                    
                    Text("Pending jobs: ")
                        .padding(20)
                    JobDetailListingCellView(job: JobListDomainModel())
                        .padding(10)
                    
                    Text("Jobs done by you: ")
                        .padding(20)
                    
                    JobDetailListingCellView(job: JobListDomainModel())
                        .padding(10)
                }
                
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(20)
            .padding(.bottom, 90)
            
            HStack {
                Button("Logout") {

                }
                .frame(width: 80)
                .padding(20)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(20)
                
            }
            .padding(20)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
        }
    }
}

func userDescriptionView(type: String, value: String) -> some View {
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

func workingJobsCard() -> some View {
    return VStack {
        //        HStack
    }
}

#Preview {
    UserProfileView()
}
