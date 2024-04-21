//
//  UserLoginView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol LoginButtonDelegate: AnyObject {
    func loginButtonTapped(username: String, password: String)
    func registerButtonTapped()
}

struct UserLoginView: View {
    
    @State private var username: String = String()
    @State private var password: String = String()
    @State private var isPassVisible: Bool = false
    @State private var errorMsg: String = String()
    
    weak var delegate: LoginButtonDelegate?
    
    init(
        delegate: LoginButtonDelegate?,
        errorMsg: String
    ) {
        self.delegate = delegate
        self.errorMsg = errorMsg
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
                
                ZStack(alignment: .trailing) {
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
                    
                    Button(action: {
                        isPassVisible.toggle()
                    }) {
                        Image(systemName: isPassVisible ? "eye": "eye.slash")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    .padding(.trailing, 20)
                }
                
                Text(errorMsg)
                    .foregroundColor(.red)
                
                Button("Login") {
                    delegate?.loginButtonTapped(username: username, password: password)
                }
                .padding(30)
                .background(Color.teal)
                .cornerRadius(20)
                .foregroundColor(.white)
                .padding(20)
                
                Text("REGISTER")
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                    .onTapGesture {
                        delegate?.registerButtonTapped()
                    }
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
    
    func updateErrorMsg(msg: String) {
        errorMsg = msg
    }
}

#Preview {
    UserLoginView(delegate: nil, errorMsg: "error message")
}
