//
//  RegisterUsernameView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

protocol RegisterUsernameDelegate: AnyObject {
    func usernameChanged(text: String)
    func registerButtonTapped(username: String, pass: String)
}

struct RegisterUsernameView: View {
    
    @State private var username: String = String()
    @State private var password: String = String()
    @State private var isPassVisible: Bool = false
    @State private var errorMsg: String = String()
    
    weak var delegate: RegisterUsernameDelegate?
    
    init(
        delegate: RegisterUsernameDelegate?,
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
                    .onChange(of: username) {
                        delegate?.usernameChanged(text: username)
                    }
                
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
                
                Button("Register") {
                    delegate?.registerButtonTapped(username: username, pass: password)
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
    
    func updateErrorMsg(msg: String) {
        errorMsg = msg
    }
}

#Preview {
    RegisterUsernameView(delegate: nil, errorMsg: "errorMsg")
}
