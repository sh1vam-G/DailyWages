//
//  UserLoginView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol LoginButtonDelegate: AnyObject {
    func loginButtonTapped(username: String, password: String)
}

struct UserLoginView: View {
    
    @State private var username: String = String()
    @State private var password: String = String()
    @State private var isPassVisible: Bool = false
    
    weak var delegate: LoginButtonDelegate?
    
    init(delegate: LoginButtonDelegate? ) {
        self.delegate = delegate
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                TextField("Username", text: $username)
                    .frame(height: 20)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(10)
                if isPassVisible {
                    TextField("Password", text: $password)
                        .frame(height: 20)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(10)
                } else {
                    SecureField("Password", text: $password)
                        .frame(height: 20)
                        .padding(20)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding(10)
                }
                Button("Login") {
                    delegate?.loginButtonTapped(username: username, password: password)
                }
                .padding(30)
                .background(Color.teal)
                .cornerRadius(20)
                .foregroundColor(.white)
                .padding(20)
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(50)
            .shadow(color: .gray, radius: 2, x: 0, y: 1)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.5))
    }
}

#Preview {
    UserLoginView(delegate: nil)
}
