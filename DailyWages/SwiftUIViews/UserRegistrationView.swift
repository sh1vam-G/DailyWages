//
//  UserRegistrationView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol UserRegistrationProtocol: AnyObject {
    func doneButtonTapped(userData: UserRegistrationModel)
    func cancelButtonTapped()
}

struct UserRegistrationView: View {
    @ObservedObject var userModel: UserRegistrationModel = UserRegistrationModel()
    var genderTypes: [String] = ["Male","Female","Others"]
    var date: Date = Date()
    weak var delegate: UserRegistrationProtocol?
    
    init(delegate: UserRegistrationProtocol?) {
        self.delegate = delegate
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack (alignment: .leading) {
                    UserRegistrationText(type: "Username", holder: $userModel.username)
                    Text("Gender")
                        .foregroundColor(.black)
                        .padding(.horizontal,20)
                        .padding(.top, 10)
                    HStack {
                        Spacer()
                        Picker("Gender", selection: $userModel.gender) {
                            ForEach(genderTypes, id: \.self) { gender in
                                Text(gender)
                            }
                        }
                        .pickerStyle(.segmented)
                        .frame(width: 300,height: 40)
                        .padding(1)
                        .background(Color.white)
                        .cornerRadius(10)
                        Spacer()
                    }
                    UserRegistrationText(type: "Email", holder: $userModel.email)
                    DatePicker("Date Of Birth:", selection: $userModel.dateOfBirth, displayedComponents: .date)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.top, 20)
                    
                    UserRegistrationText(type: "Phone number", holder: $userModel.phoneNumber)
                    UserRegistrationText(type: "House No./Plot", holder: $userModel.houseNo)
                    UserRegistrationText(type: "Apartment/Colony", holder: $userModel.apartment)
                    UserRegistrationText(type: "City", holder: $userModel.city)
                    UserRegistrationText(type: "State", holder: $userModel.state)
                    UserRegistrationText(type: "Pincode", holder: $userModel.pincode)
                }
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(.horizontal, 20)
            .padding(.bottom, 120)
            HStack {
                Button("DONE") {
                    delegate?.doneButtonTapped(userData: userModel)
                }
                .frame(width: 80)
                .padding(20)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(20)
            
                Spacer()
                    .frame(width: 50)
                Button("CANCEL") {
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
        .background(Color.white)
    }
}

func UserRegistrationText(type: String, holder: Binding<String>) -> some View {
    @State var isError: Bool = false
    return VStack (alignment: .leading) {
        Text(type)
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .padding(.bottom, -10)
            .foregroundColor(isError ? .red : .black)
        TextField(type, text: holder)
            .foregroundColor(.black)
            .frame(height: 20)
            .padding(20)
            .background(Color.white)
            .cornerRadius(20)
            .padding(10)
            .onChange(of: holder.wrappedValue) { _ in
                isError = holder.wrappedValue.isEmpty
            }
    }
}



#Preview {
    UserRegistrationView(delegate: nil)
}
