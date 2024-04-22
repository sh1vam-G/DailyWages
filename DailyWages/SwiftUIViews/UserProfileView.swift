//
//  UserProfileView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol userProfileProtocol: AnyObject {
    func jobSelected(job: JobListDomainModel)
    func logoutButtonTapped()
}

struct UserProfileView: View {
    
    weak var delegate: userProfileProtocol?
    private var userData: UserLoginDomainModel = UserLoginDomainModel()
    
    init(
        userData: UserLoginDomainModel,
        delegate: userProfileProtocol?
    ) {
        self.userData = userData
        self.delegate = delegate
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Hi " + userData.name + "!!!")
                        .font(Font.custom("", size: 30))
                        .padding(20)
                    userDescriptionView(type: "email: ", value: userData.email)
                    userDescriptionView(type: "phone number: ", value: userData.phoneNumber)
                    userDescriptionView(type: "address: ", value: userData.address.getUserAddress())
                    
                    Text("Pending jobs: ")
                        .padding(20)
                    ForEach(userData.getInProgressJobs(), id: \.self) { job in
                        JobDetailListingCellView(job: job)
                            .padding(10)
                            .onTapGesture {
                                delegate?.jobSelected(job: job)
                            }
                    }
                    
                    Text("Jobs done by you: ")
                        .padding(20)
                    
                    ForEach(userData.getCompletedJobs(), id: \.self) { job in
                        JobDetailListingCellView(job: job)
                            .padding(10)
                            .onTapGesture {
                                delegate?.jobSelected(job: job)
                            }
                    }
                }
                
            }
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(20)
            .padding(.bottom, 90)
            
            HStack {
                Button("Logout") {
                    delegate?.logoutButtonTapped()
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

#Preview {
    UserProfileView(userData: UserLoginDomainModel(), delegate: nil)
}
